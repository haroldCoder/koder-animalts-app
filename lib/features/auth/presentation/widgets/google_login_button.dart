import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ShadButton(
        backgroundColor: Colors.deepOrange[300],
        foregroundColor: Colors.white,
        decoration: const ShadDecoration(
          border: ShadBorder(radius: BorderRadius.all(Radius.circular(32))),
        ),
        width: double.infinity,
        onPressed: onPressed,
        text: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/google.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            const Text('Login with Google'),
          ],
        ),
      ),
    );
  }
}
