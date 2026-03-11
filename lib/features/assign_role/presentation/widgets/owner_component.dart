import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/providers/role_provider.dart';

class OwnerComponent extends ConsumerWidget {
  const OwnerComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleState = ref.watch(selectedRoleProvider);

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
        const Text('Dirección'),
        const SizedBox(height: 8),
        ShadInput(
          placeholder: const Text('Escribe tu dirección'),
          initialValue: roleState.address,
          onChanged: (value) =>
              ref.read(selectedRoleProvider.notifier).setAddress(value),
        ),
      ],
    );
  }
}
