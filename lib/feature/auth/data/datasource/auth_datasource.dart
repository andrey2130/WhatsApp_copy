import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';

class ConfirmationResult {
  final String verificationId;
  final int? resendToken;

  ConfirmationResult(this.verificationId, this.resendToken);
}

abstract class AuthDatasource {
  Future<String> registerViaEmail({required RegisterParams params});
  Future<String> loginViaEmail({required LoginParams params});
  Future<String> sendOtp({required SendOtpParams params});
  Future<void> verifyOtp({required VerifyOtpParams params});
  Future<void> logOut();
}

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth _firebaseAuth;

  AuthDatasourceImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<String> sendOtp({required SendOtpParams params}) async {
    try {
      final completer = Completer<ConfirmationResult>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: params.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-verification completed, sign in automatically
          _firebaseAuth.signInWithCredential(credential);
          completer.complete(ConfirmationResult('auto_verified', null));
        },
        verificationFailed: (FirebaseAuthException e) {
          completer.completeError(
            Failure(message: e.message ?? 'Verification failed'),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          completer.complete(ConfirmationResult(verificationId, resendToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.complete(ConfirmationResult(verificationId, null));
        },
      );

      final result = await completer.future;
      return result.verificationId;
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> verifyOtp({required VerifyOtpParams params}) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: params.verificationId,
        smsCode: params.otpCode,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<String> loginViaEmail({required LoginParams params}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return credential.user?.uid ?? '';
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email address.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'Invalid email address.';
          break;
        case 'user-disabled':
          message = 'This account has been disabled.';
          break;
        case 'too-many-requests':
          message = 'Too many failed attempts. Please try again later.';
          break;
        default:
          message = 'Login failed: ${e.message}';
      }
      throw Failure(message: message);
    } catch (e) {
      throw Failure(message: 'An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<String> registerViaEmail({required RegisterParams params}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return credential.user?.uid ?? '';
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
