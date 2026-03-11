import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class WidgetsHero extends StatelessWidget {
  const WidgetsHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShadButton(
            backgroundColor: const Color(0xDCFF7349),
            padding: const EdgeInsets.all(20),
            height: 100,
            decoration: ShadDecoration(
              border: ShadBorder(radius: BorderRadius.circular(15)),
            ),
            text: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_today),
                Text(
                  'Historial de citas',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ShadButton(
            backgroundColor: Colors.black26,
            padding: const EdgeInsets.all(20),
            height: 100,
            decoration: ShadDecoration(
              border: ShadBorder(radius: BorderRadius.circular(15)),
            ),
            text: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.description_outlined),
                Text('Historial médico', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
