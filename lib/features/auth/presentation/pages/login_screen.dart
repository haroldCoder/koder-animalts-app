import 'package:flutter/material.dart';
import 'package:koder_animalts_app/features/auth/presentation/widgets/auth_brand_logo.dart';
import 'package:koder_animalts_app/features/auth/presentation/widgets/google_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
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
              GoogleLoginButton(
                onPressed: () {
                  // TODO: Implement Google Login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
