import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/log_out_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/sent_otp_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/verify_otp_usecase.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc.freezed.dart';

@Injectable()
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final LogOutUsecase _logOutUsecase;

  AuthBloc(this._sendOtpUsecase, this._verifyOtpUsecase, this._logOutUsecase)
    : super(const AuthBlocState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SendOtp>(_onSendOtp);
    on<ResendOtp>(_onResendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<LogOut>(_onLogOut);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      emit(const AuthBlocState.otpVerified());
    } else {
      emit(const AuthBlocState.unauthenticated());
    }
  }

  Future<void> _onSendOtp(SendOtp event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _sendOtpUsecase(event.params);

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (verificationId) => emit(
        AuthBlocState.otpSent(
          phoneNumber: event.params.phoneNumber,
          verificationId: verificationId,
        ),
      ),
    );
  }

  Future<void> _onResendOtp(
    ResendOtp event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final result = await _sendOtpUsecase(event.params);

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (verificationId) => emit(
        AuthBlocState.otpSent(
          phoneNumber: event.params.phoneNumber,
          verificationId: verificationId,
        ),
      ),
    );
  }

  Future<void> _onVerifyOtp(
    VerifyOtp event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final result = await _verifyOtpUsecase(event.params);

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (_) => emit(const AuthBlocState.otpVerified()),
    );
  }

  Future<void> _onLogOut(LogOut event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    await _logOutUsecase(const NoParams());
    emit(const AuthBlocState.unauthenticated());
  }
}
