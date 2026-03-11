import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koder_animalts_app/features/veterinary_clinics/presentation/providers/veterinary_clinic_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/providers/role_provider.dart';

class VeterinarianComponent extends ConsumerWidget {
  const VeterinarianComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleState = ref.watch(selectedRoleProvider);
    final clinicsAsync = ref.watch(veterinaryClinicsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Número de contacto'),
        const SizedBox(height: 8),
        ShadInput(
          placeholder: const Text('Escribe tu número'),
          initialValue: roleState.contact,
          onChanged: (value) =>
              ref.read(selectedRoleProvider.notifier).setContact(value),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const Text('Especialidad'),
        const SizedBox(height: 8),
        ShadInput(
          placeholder: const Text('Escribe tu especialidad'),
          initialValue: roleState.specialty,
          onChanged: (value) =>
              ref.read(selectedRoleProvider.notifier).setSpecialty(value),
        ),
        const SizedBox(height: 16),
        const Text('Clínica Veterinaria'),
        const SizedBox(height: 8),
        clinicsAsync.when(
          data: (clinics) => SizedBox(
            width: double.infinity,
            child: ShadSelect<String>(
              placeholder: const Text('Seleccionar clínica'),
              initialValue: roleState.clinicId != ''
                  ? roleState.clinicId
                  : null,
              options: clinics
                  .map(
                    (clinic) =>
                        ShadOption(value: clinic.id, child: Text(clinic.name)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(selectedRoleProvider.notifier).setClinicId(value);
                }
              },
              selectedOptionBuilder: (context, value) {
                final clinic = clinics.firstWhere((c) => c.id == value);
                return Text(clinic.name);
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text(
            style: TextStyle(color: Colors.red),
            'Error al cargar clínicas: $err',
          ),
        ),
      ],
    );
  }
}
