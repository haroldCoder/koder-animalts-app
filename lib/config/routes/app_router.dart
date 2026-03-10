import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koder_animalts_app/core/widgets/app_shell.dart';
import 'package:koder_animalts_app/features/auth/presentation/pages/login_screen.dart';
import 'package:koder_animalts_app/features/home/presentation/pages/home_page.dart';
import 'package:koder_animalts_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/pages/assign_role_page.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String assignRole = '/assign-role';
  static const String home = '/home';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: assignRole, builder: (context, state) => AssignRolePage()),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          // Rama 0 – Inicio
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // Rama 1 – Citas (placeholder, agregar página cuando exista)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/citas',
                builder: (context, state) => Text('Citas'),
              ),
            ],
          ),
          // Rama 2 – Perfil (placeholder, agregar página cuando exista)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/perfil',
                builder: (context, state) => Text('Perfil'),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
