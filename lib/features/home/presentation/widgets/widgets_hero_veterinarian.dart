import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class WidgetsHeroVeterinarian extends ConsumerWidget {
  const WidgetsHeroVeterinarian({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShadButton(
            backgroundColor: const Color(0xDCFF7349),
            padding: const EdgeInsets.all(20),
            height: 100,
            decoration: ShadDecoration(
              border: ShadBorder(radius: BorderRadius.circular(15)),
            ),
            text: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today),
                SizedBox(height: 15),
                Text(
                  'Historial de citas',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
