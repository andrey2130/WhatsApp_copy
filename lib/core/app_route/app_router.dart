import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/services/auth_service.dart';
import 'package:telegram_copy/core/services/route_guard_service.dart';
import 'package:telegram_copy/feature/auth/pages/screens/sign_via_phone.dart';
import 'package:telegram_copy/feature/auth/pages/screens/sign_in_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/opt_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/register_screen.dart';

import 'package:telegram_copy/feature/chat_list/presentation/pages/main_screen.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/about_screen.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/chat_screen.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/change_user_name.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/setting_screen.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/user_setting_screen.dart';
import 'package:telegram_copy/injections.dart';

class OtpRouteData {
  final String phoneNumber;
  final String verificationId;

  OtpRouteData({required this.phoneNumber, required this.verificationId});
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) =>
      RouteGuardService.instance.checkAuthRedirect(state),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInViaPhoneScreen(),
    ),
    GoRoute(
      path: '/opt',
      builder: (context, state) {
        final routeData = state.extra as OtpRouteData;
        return OptScreen(
          phoneNumber: routeData.phoneNumber,
          verificationId: routeData.verificationId,
        );
      },
    ),
    GoRoute(path: '/home', builder: (context, state) => const MainScreen()),
    GoRoute(
      path: '/email_auth',
      builder: (context, state) => const EmailAuthScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: '/settings/user',
      builder: (context, state) => const UserSettingScreen(),
    ),
    GoRoute(
      path: '/settings/user/change_name',
      builder: (context, state) => const ChangeUserName(),
    ),
    GoRoute(
      path: '/chat_list/user/:uid',
      builder: (context, state) {
        final uid = state.pathParameters['uid']!;
        final extra = state.extra as Map<String, dynamic>?;
        final userName = extra != null && extra['name'] is String
            ? (extra['name'] as String)
            : uid;
        final conversationId =
            extra != null && extra['conversationId'] is String
            ? extra['conversationId'] as String
            : uid;
        final rawPhoto = extra != null && extra['photoUrl'] is String
            ? extra['photoUrl'] as String
            : null;
        final avatarUrl = (rawPhoto != null && rawPhoto.trim().isNotEmpty)
            ? rawPhoto
            : null;
        final receiverIds = extra != null && extra['receiverIds'] is List
            ? List<String>.from(extra['receiverIds'] as List)
            : [uid];
        return FutureBuilder<Either<Failure, String?>>(
          future: getIt<AuthService>().getCurrentUserId(),
          builder: (context, snapshot) {
            final userId =
                snapshot.data?.fold(
                  (failure) => '',
                  (userId) => userId ?? '',
                ) ??
                '';

            return ChatScreen(
              userId: userId,
              userName: userName,
              avatarUrl: avatarUrl,
              conversationId: conversationId,
              receiverIds: receiverIds,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/settings/user/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
  onException: (context, state, router) {
    if (state.uri.toString().contains('firebaseauth/link')) {
      router.go('/');
    }
  },
);
