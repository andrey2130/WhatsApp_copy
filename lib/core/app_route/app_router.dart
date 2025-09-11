import 'package:go_router/go_router.dart';
import 'package:telegram_copy/feature/auth/pages/screens/auth_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const AuthScreen())],
);
