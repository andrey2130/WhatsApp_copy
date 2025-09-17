import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/login_via_phone_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/feature/auth/data/datasource/user_datasource.dart';
import 'package:telegram_copy/injections.dart';

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
  final UserDataSource _userDataSource;

  AuthDatasourceImpl({
    required FirebaseAuth firebaseAuth,
    required UserDataSource userDataSource,
  }) : _firebaseAuth = firebaseAuth,
       _userDataSource = userDataSource;

  @override
  Future<String> sendOtp({required SendOtpParams params}) async {
    try {
      final completer = Completer<ConfirmationResult>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: params.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-verification completed, sign in automatically
          if (!completer.isCompleted) {
            _firebaseAuth.signInWithCredential(credential);
            completer.complete(ConfirmationResult('auto_verified', null));
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            getIt<Talker>().error('Phone verification failed: ${e.message}');
            completer.completeError(
              Failure(message: e.message ?? 'Verification failed'),
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) {
            getIt<Talker>().info('OTP code sent successfully');
            completer.complete(ConfirmationResult(verificationId, resendToken));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (!completer.isCompleted) {
            completer.complete(ConfirmationResult(verificationId, null));
          }
        },
      );

      final result = await completer.future;
      return result.verificationId;
    } catch (e) {
      getIt<Talker>().handle(e);
      rethrow;
    }
  }

  @override
  Future<void> verifyOtp({required VerifyOtpParams params}) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: params.verificationId,
        smsCode: params.otpCode,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user != null) {
        await _userDataSource.saveUserData(
          user,
          LoginViaPhoneParams(
            phoneNumber: params.phoneNumber,
            otpCode: params.otpCode,
            bio: 'Hey there! I am using WhatsApp.',
          ),
        );
      }
    } catch (e, stackTrace) {
      getIt<Talker>().handle(e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e, stackTrace) {
      getIt<Talker>().handle(e, stackTrace);
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
      getIt<Talker>().handle(e);
      rethrow;
    }
  }

  @override
  Future<String> registerViaEmail({required RegisterParams params}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = credential.user;
      if (user != null) {
        await _userDataSource.saveUserDataEmail(
          user,
          RegisterParams(
            bio: 'Hey there! I am using WhatsApp.',
            name: params.name,
            email: params.email,
            password: params.password,
            confirmPassword: params.confirmPassword,
          ),
        );
      }

      return user?.uid ?? '';
    } catch (e) {
      getIt<Talker>().handle(e);
      rethrow;
    }
  }
}
