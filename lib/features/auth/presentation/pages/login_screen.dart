import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:koder_animalts_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:koder_animalts_app/features/auth/presentation/widgets/auth_brand_logo.dart';
import 'package:koder_animalts_app/features/auth/presentation/widgets/google_login_button.dart';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';
import 'package:koder_animalts_app/features/user/presentation/providers/user_provider.dart';
import 'package:koder_animalts_app/shared/widgets/spinner_main.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isUserLoading = ref.watch(userProvider).isLoading;

    ref.listen(authProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data != null && data['data'] != null) {
            ref.read(userProvider.notifier).getUser(data['data'] as String);
          }
        },
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Auth Error: $error')));
        },
        loading: () {},
      );
    });

    ref.listen(userProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            if (user.role != RoleEnum.UNKNOWN) {
              context.go("/home");
            } else {
              context.go('/assign-role');
            }
          }
        },
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('User Error: $error')));
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthBrandLogo(),
                  const Spacer(),
                  const Text(
                    'Welcome to Koder Animalts',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  if (authState.isLoading)
                    const SpinnerMain()
                  else
                    GoogleLoginButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).loginWithGoogle();
                      },
                    ),
                ],
              ),
            ),
          ),
          if (isUserLoading) const SpinnerMain(),
        ],
      ),
    );
  }
}
