import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UpcomingSchedules extends ConsumerWidget {
  const UpcomingSchedules({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () {},
              text: const Text(
                'Ver todas',
                style: TextStyle(color: Color(0xFFFF7349), fontSize: 15),
              ),
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
                    Icons.calendar_today,
                    size: 28,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 25),
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
