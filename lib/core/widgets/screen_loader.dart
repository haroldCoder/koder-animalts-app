import 'package:flutter/material.dart';
import 'package:koder_animalts_app/shared/widgets/spinner_main.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(child: SpinnerMain()),
    );
  }
}
