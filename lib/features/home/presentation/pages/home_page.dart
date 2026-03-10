import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/pets_view.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/snackbar_user.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/upcoming_visit.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/widgets_hero.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SafeArea(
        child: Column(
          children: [
            const SnackbarUser(),
            const SizedBox(height: 20),
            const WidgetsHero(),
            const SizedBox(height: 20),
            const PetsView(),
            const SizedBox(height: 20),
            const UpcomingVisit(),
          ],
        ),
      ),
    );
  }
}
