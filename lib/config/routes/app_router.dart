import 'package:go_router/go_router.dart';
import 'package:koder_animalts_app/features/auth/presentation/pages/login_screen.dart';
import 'package:koder_animalts_app/features/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
    ],
  );
}
