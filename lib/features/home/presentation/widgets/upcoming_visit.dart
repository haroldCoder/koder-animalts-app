import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UpcomingVisit extends StatelessWidget {
  const UpcomingVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Próximas citas',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            ShadButton(
              backgroundColor: Colors.transparent,
              text: const Text(
                'Ver todas',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xDCFF7349),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.event_busy_rounded,
                    size: 28,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'No tienes próximas citas',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
