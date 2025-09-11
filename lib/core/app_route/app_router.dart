import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_copy/feature/auth/pages/screens/auth_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/sign_in_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/opt_screen.dart';
import 'package:telegram_copy/feature/auth/pages/screens/register_screen.dart';
import 'package:telegram_copy/feature/home/home_screen.dart';

class OtpRouteData {
  final String phoneNumber;
  final String verificationId;

  OtpRouteData({required this.phoneNumber, required this.verificationId});
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final isAuthRoute =
        state.uri.path == '/' ||
        state.uri.path == '/email_auth' ||
        state.uri.path == '/register' ||
        state.uri.path.startsWith('/opt');

    if (user == null && !isAuthRoute) {
      return '/';
    }

    if (user != null && isAuthRoute) {
      return '/home';
    }

    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
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
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/email_auth',
      builder: (context, state) => const EmailAuthScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
  onException: (context, state, router) {
    if (state.uri.toString().contains('firebaseauth/link')) {
      router.go('/');
    }
  },
);
