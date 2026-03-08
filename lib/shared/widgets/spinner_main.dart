import 'package:flutter/material.dart';

class SpinnerMain extends StatelessWidget {
  const SpinnerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.deepOrangeAccent),
    );
  }
}
