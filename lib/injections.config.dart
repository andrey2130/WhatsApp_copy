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
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/services/auth_service.dart' as _i630;
import 'core/services/auth_service_impl.dart' as _i940;
import 'feature/auth/data/datasource/auth_datasource.dart' as _i274;
import 'feature/auth/data/datasource/user_datasource.dart' as _i574;
import 'feature/auth/data/repo/auth_repo_impl.dart' as _i939;
import 'feature/auth/domain/repo/auth_repo.dart' as _i583;
import 'feature/auth/domain/usecases/get_current_user_usecase.dart' as _i1027;
import 'feature/auth/domain/usecases/log_out_usecase.dart' as _i655;
import 'feature/auth/domain/usecases/login_via_email_usecase.dart' as _i86;
import 'feature/auth/domain/usecases/register_via_email_usecase.dart' as _i836;
import 'feature/auth/domain/usecases/sent_otp_usecase.dart' as _i688;
import 'feature/auth/domain/usecases/verify_otp_usecase.dart' as _i234;
import 'feature/auth/pages/bloc/bloc/auth_bloc.dart' as _i147;
import 'feature/chat_list/data/datasource/chat_datasourse.dart' as _i330;
import 'feature/chat_list/data/datasource/chat_list_datasource.dart' as _i449;
import 'feature/chat_list/data/repo/chat_list_repo_impl.dart' as _i622;
import 'feature/chat_list/data/repo/chat_repo_impl.dart' as _i921;
import 'feature/chat_list/domain/repo/chat_list_repo.dart' as _i778;
import 'feature/chat_list/domain/repo/chat_repo.dart' as _i402;
import 'feature/chat_list/domain/usecases/create_chat_usecase.dart' as _i773;
import 'feature/chat_list/domain/usecases/delete_meesage_usecase.dart' as _i6;
import 'feature/chat_list/domain/usecases/get_users_usecase.dart' as _i902;
import 'feature/chat_list/domain/usecases/load_chat_messages_usecase.dart'
    as _i849;
import 'feature/chat_list/domain/usecases/load_chat_usecase.dart' as _i835;
import 'feature/chat_list/domain/usecases/read_message.dart' as _i592;
import 'feature/chat_list/domain/usecases/send_message_usecase.dart' as _i410;
import 'feature/chat_list/domain/usecases/send_photo_usecase.dart' as _i854;
import 'feature/chat_list/domain/usecases/watch_chats_usecase.dart' as _i566;
import 'feature/chat_list/domain/usecases/watch_message_usecase.dart' as _i241;
import 'feature/chat_list/presentation/bloc/chat_screen/chat_screen_bloc.dart'
    as _i912;
import 'feature/chat_list/presentation/bloc/chats/chats_bloc.dart' as _i322;
import 'feature/chat_list/presentation/bloc/users/users_bloc.dart' as _i456;
import 'feature/settings/data/datasource/settings_datasource.dart' as _i1000;
import 'feature/settings/data/repo/settings_repo_impl.dart' as _i757;
import 'feature/settings/domain/repo/settings_repo.dart' as _i920;
import 'feature/settings/domain/usecases/get_user_data_usecase.dart' as _i481;
import 'feature/settings/domain/usecases/update_about_usecase.dart' as _i816;
import 'feature/settings/domain/usecases/update_user_name_usecase.dart'
    as _i577;
import 'feature/settings/domain/usecases/upload_avatar_usecase.dart' as _i966;
import 'feature/settings/presentation/bloc/settings_bloc.dart' as _i293;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i330.ChatDatasource>(
      () => _i330.ChatDatasourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i457.FirebaseStorage>(),
      ),
    );
    gh.factory<_i630.AuthService>(
      () => _i940.AuthServiceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i1000.SettingsDatasource>(
      () => _i1000.SettingsDatasourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i457.FirebaseStorage>(),
      ),
    );
    gh.factory<_i574.UserDataSource>(
      () => _i574.UserDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i449.ChatListDatasource>(
      () => _i449.ChatListDatasourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i920.SettingsRepo>(
      () => _i757.SettingsRepoImpl(
        settingsDatasource: gh<_i1000.SettingsDatasource>(),
      ),
    );
    gh.factory<_i402.ChatRepo>(
      () => _i921.ChatRepoImpl(chatDatasource: gh<_i330.ChatDatasource>()),
    );
    gh.factory<_i854.SendPhotoUsecase>(
      () => _i854.SendPhotoUsecase(gh<_i402.ChatRepo>()),
    );
    gh.factory<_i274.AuthDatasource>(
      () => _i274.AuthDatasourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        userDataSource: gh<_i574.UserDataSource>(),
      ),
    );
    gh.factory<_i241.WatchMessageUsecase>(
      () => _i241.WatchMessageUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i849.LoadChatMessagesUsecase>(
      () => _i849.LoadChatMessagesUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i773.CreateChatUsecase>(
      () => _i773.CreateChatUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i835.LoadChatsUsecase>(
      () => _i835.LoadChatsUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i592.ReadMessageUsecase>(
      () => _i592.ReadMessageUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i6.DeleteMeesageUsecase>(
      () => _i6.DeleteMeesageUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i410.SendMessageUsecase>(
      () => _i410.SendMessageUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i566.WatchChatsUsecase>(
      () => _i566.WatchChatsUsecase(chatRepo: gh<_i402.ChatRepo>()),
    );
    gh.factory<_i778.ChatListRepo>(
      () => _i622.ChatListRepoImpl(
        chatListDatasource: gh<_i449.ChatListDatasource>(),
      ),
    );
    gh.factory<_i912.ChatScreenBloc>(
      () => _i912.ChatScreenBloc(
        loadChatMessagesUsecase: gh<_i849.LoadChatMessagesUsecase>(),
        watchMessageUsecase: gh<_i241.WatchMessageUsecase>(),
        sendMessageUsecase: gh<_i410.SendMessageUsecase>(),
        sendPhotoUsecase: gh<_i854.SendPhotoUsecase>(),
        deleteMeesageUsecase: gh<_i6.DeleteMeesageUsecase>(),
        readMessageUsecase: gh<_i592.ReadMessageUsecase>(),
      ),
    );
    gh.factory<_i902.GetUsersUsecase>(
      () => _i902.GetUsersUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i816.UpdateAboutUsecase>(
      () => _i816.UpdateAboutUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i577.UpdateUserNameUsecase>(
      () => _i577.UpdateUserNameUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i481.GetUserDataUsecase>(
      () => _i481.GetUserDataUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i583.AuthRepo>(
      () => _i939.AuthRepoImpl(authDatasource: gh<_i274.AuthDatasource>()),
    );
    gh.factory<_i966.UploadAvatarUsecase>(
      () => _i966.UploadAvatarUsecase(gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i293.SettingsBloc>(
      () => _i293.SettingsBloc(
        getUserDataUsecase: gh<_i481.GetUserDataUsecase>(),
        updateUserNameUsecase: gh<_i577.UpdateUserNameUsecase>(),
        updateAboutUsecase: gh<_i816.UpdateAboutUsecase>(),
        uploadAvatarUsecase: gh<_i966.UploadAvatarUsecase>(),
      ),
    );
    gh.factory<_i1027.GetCurrentUserUsecase>(
      () => _i1027.GetCurrentUserUsecase(gh<_i583.AuthRepo>()),
    );
    gh.factory<_i456.UsersBloc>(
      () => _i456.UsersBloc(getUsersUsecase: gh<_i902.GetUsersUsecase>()),
    );
    gh.factory<_i322.ChatsBloc>(
      () => _i322.ChatsBloc(
        loadChatsUsecase: gh<_i835.LoadChatsUsecase>(),
        createChatUsecase: gh<_i773.CreateChatUsecase>(),
        watchChatsUsecase: gh<_i566.WatchChatsUsecase>(),
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
