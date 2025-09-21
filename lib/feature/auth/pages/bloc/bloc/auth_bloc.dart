import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/app_route/app_router.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/log_out_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/login_via_email_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/register_via_email_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/sent_otp_usecase.dart';
import 'package:telegram_copy/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc.freezed.dart';

@Injectable()
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final LogOutUsecase _logOutUsecase;
  final LoginViaEmailUsecase _loginViaEmailUsecase;
  final RegisterViaEmailUsecase _registerViaEmailUsecase;

  AuthBloc(
    this._sendOtpUsecase,
    this._verifyOtpUsecase,
    this._logOutUsecase,
    this._loginViaEmailUsecase,
    this._registerViaEmailUsecase,
  ) : super(const AuthBlocState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SendOtp>(_onSendOtp);
    on<ResendOtp>(_onResendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<LogOut>(_onLogOut);
    on<LoginViaEmail>(_onLoginViaEmail);
    on<RegisterViaEmail>(_onRegisterViaEmail);
    on<AuthStateChanged>(_onAuthStateChanged);

    _listenToAuthChanges();
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());
    getIt<Talker>().info('Checking auth status...');

    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      getIt<Talker>().info('User is authenticated: ${currentUser.uid}');
      emit(AuthBlocState.authenticated(userId: currentUser.uid));
    } else {
      getIt<Talker>().info('User is not authenticated');
      emit(const AuthBlocState.unauthenticated());
    }
  }

  Future<void> _onSendOtp(SendOtp event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _sendOtpUsecase(event.params);

    result.fold(
      (failure) {
        emit(AuthBlocState.failure(message: failure.message));
        getIt<Talker>().handle(failure.message);
      },
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
      (failure) {
        emit(AuthBlocState.failure(message: failure.message));
        getIt<Talker>().handle(failure.message);
      },
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

    result.fold((failure) {
      emit(AuthBlocState.failure(message: failure.message));
      getIt<Talker>().handle(failure.message);
    }, (_) => emit(const AuthBlocState.otpVerified()));
  }

  Future<void> _onLogOut(LogOut event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    await _logOutUsecase(const NoParams());
    getIt<Talker>().info('User logged out');
    emit(const AuthBlocState.unauthenticated());

    appRouter.refresh();
  }

  Future<void> _onLoginViaEmail(
    LoginViaEmail event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final result = await _loginViaEmailUsecase(event.params);

    result.fold((failure) {
      emit(AuthBlocState.failure(message: failure.message));
      getIt<Talker>().handle(failure.message);
    }, (userId) => emit(AuthBlocState.authenticated(userId: userId)));
  }

  Future<void> _onRegisterViaEmail(
    RegisterViaEmail event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final result = await _registerViaEmailUsecase(event.params);

    result.fold((failure) {
      emit(AuthBlocState.failure(message: failure.message));
      getIt<Talker>().handle(failure.message);
    }, (userId) => emit(AuthBlocState.authenticated(userId: userId)));
  }

  Future<void> _onAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthBlocState> emit,
  ) async {
    if (event.userId != null) {
      getIt<Talker>().info(
        'Auth state changed: User authenticated: ${event.userId}',
      );
      emit(AuthBlocState.authenticated(userId: event.userId!));
    } else {
      getIt<Talker>().info('Auth state changed: User unauthenticated');
      emit(const AuthBlocState.unauthenticated());
    }

    appRouter.refresh();
  }

  void _listenToAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      add(AuthBlocEvent.authStateChanged(userId: user?.uid));
    });
  }
}
