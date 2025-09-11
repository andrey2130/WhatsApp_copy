import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/verify_otp_params.dart';

class ConfirmationResult {
  final String verificationId;
  final int? resendToken;

  ConfirmationResult(this.verificationId, this.resendToken);
}

abstract class AuthDatasource {
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
}
