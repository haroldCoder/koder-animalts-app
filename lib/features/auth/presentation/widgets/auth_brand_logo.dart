import 'package:flutter/material.dart';

class AuthBrandLogo extends StatelessWidget {
  const AuthBrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'lib/assets/icon_alternative.png',
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
