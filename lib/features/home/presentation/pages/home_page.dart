import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koder_animalts_app/core/providers/storage_provider.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/pets_view.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/snackbar_user.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/upcoming_schedules.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/upcoming_visit.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/widgets_hero.dart';
import 'package:koder_animalts_app/features/home/presentation/widgets/widgets_hero_veterinarian.dart';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';
import 'package:koder_animalts_app/features/user/presentation/providers/user_provider.dart';
import 'package:koder_animalts_app/shared/widgets/spinner_main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    if (userAsync.value == null && !userAsync.isLoading) {
      Future.microtask(() {
        final idUser = sharedPreferences.getString('idUser');
        if (idUser != null && idUser.isNotEmpty) {
          ref.read(userProvider.notifier).getUser(idUser);
        }
      });
    }

    if (userAsync.isLoading || userAsync.value == null) {
      return const Center(child: SpinnerMain());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SafeArea(
        child: Column(
          children: [
            const SnackbarUser(),
            const SizedBox(height: 20),
            if (userAsync.value?.role == RoleEnum.OWNER) const WidgetsHero(),
            if (userAsync.value?.role == RoleEnum.VETERINARIAN)
              const WidgetsHeroVeterinarian(),
            const SizedBox(height: 20),
            if (userAsync.value?.role == RoleEnum.OWNER) const PetsView(),
            const SizedBox(height: 20),
            if (userAsync.value?.role == RoleEnum.VETERINARIAN)
              const UpcomingSchedules(),
            if (userAsync.value?.role == RoleEnum.OWNER) const UpcomingVisit(),
          ],
        ),
      ),
    );
  }
}
