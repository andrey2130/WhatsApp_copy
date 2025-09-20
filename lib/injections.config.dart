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
import 'feature/auth/domain/usecases/get_current_user_usecase.dart' as _i1027;
import 'feature/auth/domain/usecases/log_out_usecase.dart' as _i655;
import 'feature/auth/domain/usecases/login_via_email_usecase.dart' as _i86;
import 'feature/auth/domain/usecases/register_via_email_usecase.dart' as _i836;
import 'feature/auth/domain/usecases/sent_otp_usecase.dart' as _i688;
import 'feature/auth/domain/usecases/verify_otp_usecase.dart' as _i234;
import 'feature/auth/pages/bloc/bloc/auth_bloc.dart' as _i147;
import 'feature/chat_list/data/datasource/chat_list_datasource.dart' as _i449;
import 'feature/chat_list/data/repo/chat_list_repo_impl.dart' as _i622;
import 'feature/chat_list/domain/repo/chat_list_repo.dart' as _i778;
import 'feature/chat_list/domain/usecases/create_message_usecase.dart' as _i570;
import 'feature/chat_list/domain/usecases/delete_conversation_usecase.dart'
    as _i1020;
import 'feature/chat_list/domain/usecases/delete_message_usecase.dart' as _i163;
import 'feature/chat_list/domain/usecases/get_all_conversations.dart' as _i689;
import 'feature/chat_list/domain/usecases/get_all_messages.dart' as _i258;
import 'feature/chat_list/domain/usecases/get_all_users_usecase.dart' as _i820;
import 'feature/chat_list/domain/usecases/send_conversation_usecase.dart'
    as _i977;
import 'feature/chat_list/domain/usecases/send_message_usecase.dart' as _i410;
import 'feature/chat_list/domain/usecases/subscribe_conversations_usecase.dart'
    as _i198;
import 'feature/chat_list/domain/usecases/subscribe_messages_usecase.dart'
    as _i183;
import 'feature/chat_list/domain/usecases/update_conversation_usecase.dart'
    as _i972;
import 'feature/chat_list/domain/usecases/update_message_usecase.dart' as _i566;
import 'feature/chat_list/presentation/bloc/chat_list_bloc.dart' as _i206;
import 'feature/chat_list/presentation/bloc/conversations/conversations_bloc.dart'
    as _i316;
import 'feature/chat_list/presentation/bloc/messages/messages_bloc.dart'
    as _i69;
import 'feature/chat_list/presentation/bloc/users/users_bloc.dart' as _i456;
import 'feature/settings/data/datasource/settings_datasource.dart' as _i1000;
import 'feature/settings/data/repo/settings_repo_impl.dart' as _i757;
import 'feature/settings/domain/repo/settings_repo.dart' as _i920;
import 'feature/settings/domain/usecases/get_user_data_usecase.dart' as _i481;
import 'feature/settings/domain/usecases/update_about_usecase.dart' as _i816;
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
    gh.factory<_i1000.SettingsDatasource>(
      () => _i1000.SettingsDatasourceImpl(gh<_i974.FirebaseFirestore>()),
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
    gh.factory<_i274.AuthDatasource>(
      () => _i274.AuthDatasourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        userDataSource: gh<_i574.UserDataSource>(),
      ),
    );
    gh.factory<_i778.ChatListRepo>(
      () => _i622.ChatListRepoImpl(
        chatListDatasource: gh<_i449.ChatListDatasource>(),
      ),
    );
    gh.factory<_i820.GetAllUsersUsecase>(
      () => _i820.GetAllUsersUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i689.GetAllConversationsUsecase>(
      () => _i689.GetAllConversationsUsecase(
        chatListRepo: gh<_i778.ChatListRepo>(),
      ),
    );
    gh.factory<_i566.UpdateMessageUsecase>(
      () => _i566.UpdateMessageUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i163.DeleteMessageUsecase>(
      () => _i163.DeleteMessageUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i977.SendConversationUsecase>(
      () =>
          _i977.SendConversationUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i1020.DeleteConversationUsecase>(
      () => _i1020.DeleteConversationUsecase(
        chatListRepo: gh<_i778.ChatListRepo>(),
      ),
    );
    gh.factory<_i410.SendMessageUsecase>(
      () => _i410.SendMessageUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i972.UpdateConversationUsecase>(
      () => _i972.UpdateConversationUsecase(
        chatListRepo: gh<_i778.ChatListRepo>(),
      ),
    );
    gh.factory<_i198.SubscribeConversationsUsecase>(
      () => _i198.SubscribeConversationsUsecase(
        chatListRepo: gh<_i778.ChatListRepo>(),
      ),
    );
    gh.factory<_i183.SubscribeMessagesUsecase>(
      () => _i183.SubscribeMessagesUsecase(
        chatListRepo: gh<_i778.ChatListRepo>(),
      ),
    );
    gh.factory<_i570.CreateMessageUsecase>(
      () => _i570.CreateMessageUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i258.GetAllMessagesUsecase>(
      () => _i258.GetAllMessagesUsecase(chatListRepo: gh<_i778.ChatListRepo>()),
    );
    gh.factory<_i206.ChatListBloc>(
      () => _i206.ChatListBloc(
        getAllConversationsUsecase: gh<_i689.GetAllConversationsUsecase>(),
        getAllMessagesUsecase: gh<_i258.GetAllMessagesUsecase>(),
        sendConversationUsecase: gh<_i977.SendConversationUsecase>(),
        sendMessageUsecase: gh<_i410.SendMessageUsecase>(),
        updateConversationUsecase: gh<_i972.UpdateConversationUsecase>(),
        updateMessageUsecase: gh<_i566.UpdateMessageUsecase>(),
        deleteConversationUsecase: gh<_i1020.DeleteConversationUsecase>(),
        deleteMessageUsecase: gh<_i163.DeleteMessageUsecase>(),
        subscribeConversationsUsecase:
            gh<_i198.SubscribeConversationsUsecase>(),
        subscribeMessagesUsecase: gh<_i183.SubscribeMessagesUsecase>(),
      ),
    );
    gh.factory<_i481.GetUserDataUsecase>(
      () => _i481.GetUserDataUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i577.UpdateUserNameUsecase>(
      () => _i577.UpdateUserNameUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i816.UpdateAboutUsecase>(
      () => _i816.UpdateAboutUsecase(settingsRepo: gh<_i920.SettingsRepo>()),
    );
    gh.factory<_i583.AuthRepo>(
      () => _i939.AuthRepoImpl(authDatasource: gh<_i274.AuthDatasource>()),
    );
    gh.factory<_i69.MessagesBloc>(
      () => _i69.MessagesBloc(
        getAllMessagesUsecase: gh<_i258.GetAllMessagesUsecase>(),
        createMessageUsecase: gh<_i570.CreateMessageUsecase>(),
        updateMessageUsecase: gh<_i566.UpdateMessageUsecase>(),
        deleteMessageUsecase: gh<_i163.DeleteMessageUsecase>(),
        subscribeMessagesUsecase: gh<_i183.SubscribeMessagesUsecase>(),
      ),
    );
    gh.factory<_i456.UsersBloc>(
      () => _i456.UsersBloc(getAllUsersUsecase: gh<_i820.GetAllUsersUsecase>()),
    );
    gh.factory<_i293.SettingsBloc>(
      () => _i293.SettingsBloc(
        getUserDataUsecase: gh<_i481.GetUserDataUsecase>(),
        updateUserNameUsecase: gh<_i577.UpdateUserNameUsecase>(),
        updateAboutUsecase: gh<_i816.UpdateAboutUsecase>(),
      ),
    );
    gh.factory<_i316.ConversationsBloc>(
      () => _i316.ConversationsBloc(
        getAllConversationsUsecase: gh<_i689.GetAllConversationsUsecase>(),
        sendConversationUsecase: gh<_i977.SendConversationUsecase>(),
        updateConversationUsecase: gh<_i972.UpdateConversationUsecase>(),
        deleteConversationUsecase: gh<_i1020.DeleteConversationUsecase>(),
        subscribeConversationsUsecase:
            gh<_i198.SubscribeConversationsUsecase>(),
      ),
    );
    gh.factory<_i1027.GetCurrentUserUsecase>(
      () => _i1027.GetCurrentUserUsecase(gh<_i583.AuthRepo>()),
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
