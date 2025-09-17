// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'feature/auth/data/datasource/auth_datasource.dart' as _i274;
import 'feature/auth/data/datasource/user_datasource.dart' as _i574;
import 'feature/auth/data/repo/auth_repo_impl.dart' as _i939;
import 'feature/auth/domain/repo/auth_repo.dart' as _i583;
import 'feature/auth/domain/usecases/log_out_usecase.dart' as _i655;
import 'feature/auth/domain/usecases/login_via_email_usecase.dart' as _i86;
import 'feature/auth/domain/usecases/register_via_email_usecase.dart' as _i836;
import 'feature/auth/domain/usecases/sent_otp_usecase.dart' as _i688;
import 'feature/auth/domain/usecases/verify_otp_usecase.dart' as _i234;
import 'feature/auth/pages/bloc/bloc/auth_bloc.dart' as _i147;
import 'feature/chat_list/presentation/bloc/chat_list_bloc.dart' as _i206;
import 'feature/settings/data/datasource/settings_datasource.dart' as _i1000;
import 'feature/settings/data/repo/settings_repo_impl.dart' as _i757;
import 'feature/settings/domain/repo/settings_repo.dart' as _i920;
import 'feature/settings/domain/usecases/get_user_data_usecase.dart' as _i481;
import 'feature/settings/domain/usecases/update_user_name_usecase.dart'
    as _i577;
import 'feature/settings/presentation/bloc/settings_bloc.dart' as _i293;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i206.ChatListBloc>(() => _i206.ChatListBloc());
    gh.factory<_i1000.SettingsDatasource>(
      () => _i1000.SettingsDatasourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i574.UserDataSource>(
      () => _i574.UserDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i920.SettingsRepo>(
      () => _i757.SettingsRepoImpl(
        settingsDatasource: gh<_i1000.SettingsDatasource>(),
      ),
    );
    gh.factory<_i274.AuthDatasource>(
      () => _i274.AuthDatasourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        userDataSource: gh<_i574.UserDataSource>(),
      ),
    );
    gh.factory<_i481.GetUserDataUsecase>(
      () => _i481.GetUserDataUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i577.UpdateUserNameUsecase>(
      () => _i577.UpdateUserNameUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i583.AuthRepo>(
      () => _i939.AuthRepoImpl(authDatasource: gh<_i274.AuthDatasource>()),
    );
    gh.factory<_i293.SettingsBloc>(
      () => _i293.SettingsBloc(
        getUserDataUsecase: gh<_i481.GetUserDataUsecase>(),
        updateUserNameUsecase: gh<_i577.UpdateUserNameUsecase>(),
      ),
    );
    gh.factory<_i655.LogOutUsecase>(
      () => _i655.LogOutUsecase(authRepo: gh<_i583.AuthRepo>()),
    );
    gh.factory<_i836.RegisterViaEmailUsecase>(
      () => _i836.RegisterViaEmailUsecase(authRepo: gh<_i583.AuthRepo>()),
    );
    gh.factory<_i86.LoginViaEmailUsecase>(
      () => _i86.LoginViaEmailUsecase(authRepo: gh<_i583.AuthRepo>()),
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
        gh<_i86.LoginViaEmailUsecase>(),
        gh<_i836.RegisterViaEmailUsecase>(),
      ),
    );
    return this;
  }
}
