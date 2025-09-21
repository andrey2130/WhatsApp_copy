import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:telegram_copy/core/app_route/app_router.dart';
import 'package:telegram_copy/core/theme/app_theme.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:telegram_copy/firebase_options.dart';
import 'package:telegram_copy/injections.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      configureDependencies();
      runApp(const MyApp());
    },
    (error, stackTrace) {
      getIt<Talker>().handle(error);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthBlocEvent.checkAuthStatus(
                
              )),
        ),
        BlocProvider(create: (context) => getIt<SettingsBloc>()),
        BlocProvider(create: (context) => getIt<ChatsBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: TalkerWrapper(
          talker: getIt<Talker>(),
          child: MaterialApp.router(
            routerConfig: appRouter,
            theme: AppTheme.lightTheme(context),

            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
