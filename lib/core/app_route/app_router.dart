import 'package:go_router/go_router.dart';
import 'package:telegram_copy/feature/auth/pages/screens/auth_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/opt_screen.dart';
import 'package:telegram_copy/feature/home/home_screen.dart';

class OtpRouteData {
  final String phoneNumber;
  final String verificationId;

  OtpRouteData({required this.phoneNumber, required this.verificationId});
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/opt',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
    GoRoute(
      path: '/opt',
      builder: (context, state) {
        final data =
            state.extra as OtpRouteData? ??
            OtpRouteData(
              phoneNumber: '+380123456789',
              verificationId: 'test_verification_id',
            );
        return OptScreen(
          phoneNumber: data.phoneNumber,
          verificationId: data.verificationId,
        );
      },
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
  onException: (context, state, router) {
    // Handle deep link exceptions
    if (state.uri.toString().contains('firebaseauth/link')) {
      // Redirect to auth screen for Firebase Auth callbacks
      router.go('/');
    }
  },
);
