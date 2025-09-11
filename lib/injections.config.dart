// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'feature/auth/data/datasource/auth_datasource.dart' as _i274;
import 'feature/auth/data/repo/auth_repo_impl.dart' as _i939;
import 'feature/auth/domain/repo/auth_repo.dart' as _i583;
import 'feature/auth/domain/usecases/log_out_usecase.dart' as _i655;
import 'feature/auth/domain/usecases/sent_otp_usecase.dart' as _i688;
import 'feature/auth/domain/usecases/verify_otp_usecase.dart' as _i234;
import 'feature/auth/pages/bloc/bloc/auth_bloc.dart' as _i147;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i274.AuthDatasource>(
      () => _i274.AuthDatasourceImpl(firebaseAuth: gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i583.AuthRepo>(
      () => _i939.AuthRepoImpl(authDatasource: gh<_i274.AuthDatasource>()),
    );
    gh.factory<_i655.LogOutUsecase>(
      () => _i655.LogOutUsecase(authRepo: gh<_i583.AuthRepo>()),
    );
    gh.factory<_i688.SendOtpUsecase>(
      () => _i688.SendOtpUsecase(authRepo: gh<_i583.AuthRepo>()),
    );
    gh.factory<_i234.VerifyOtpUsecase>(
      () => _i234.VerifyOtpUsecase(authRepo: gh<_i583.AuthRepo>()),
    );
    gh.factory<_i147.AuthBloc>(
      () => _i147.AuthBloc(
        gh<_i688.SendOtpUsecase>(),
        gh<_i234.VerifyOtpUsecase>(),
        gh<_i655.LogOutUsecase>(),
      ),
    );
    return this;
  }
}
