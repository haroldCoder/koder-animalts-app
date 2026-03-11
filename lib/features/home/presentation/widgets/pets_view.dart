import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PetsView extends ConsumerWidget {
  const PetsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mis mascotas',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            ShadButton(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              text: Text(
                'Agregar mascota',
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
                    color: Color(0xDCFF7349),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.pets, size: 30, color: Colors.deepOrange),
                ),
                const SizedBox(height: 25),
                Text(
                  'No tienes mascotas registradas',
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
