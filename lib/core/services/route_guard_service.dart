import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/services/auth_service.dart';
import 'package:telegram_copy/injections.dart';

class RouteGuardService {
  final AuthService authService;

  RouteGuardService(this.authService);

  static RouteGuardService get instance =>
      RouteGuardService(getIt<AuthService>());

  Future<String?> checkAuthRedirect(GoRouterState state) async {
    final userResult = await authService.getCurrentUserId();
    final isAuthRoute = _isAuthRoute(state.uri.path);

    return userResult.fold(
      (failure) {
        if (!isAuthRoute) return '/';
        return null;
      },
      (userId) {
        if (userId == null && !isAuthRoute) return '/';
        if (userId != null && isAuthRoute) return '/home';
        return null;
      },
    );
  }

  bool _isAuthRoute(String path) {
    return path == '/' ||
        path == '/email_auth' ||
        path == '/register' ||
        path.startsWith('/opt');
  }
}
