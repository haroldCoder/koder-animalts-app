import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/widgets/toast_fields_owner.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/widgets/toast_fields_veterinarian.dart';
import 'package:koder_animalts_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:koder_animalts_app/features/owner/data/models/create_owner_dto.dart';
import 'package:koder_animalts_app/features/owner/presentation/providers/owner_provider.dart';
import 'package:koder_animalts_app/features/veterinarian/data/models/create_veterinarian_dto.dart';
import 'package:koder_animalts_app/features/veterinarian/presentation/providers/veterinarian_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:koder_animalts_app/features/assign_role/domain/entities/user_role.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/providers/role_provider.dart';

import 'package:koder_animalts_app/features/assign_role/presentation/widgets/owner_component.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/widgets/veterinarian_component.dart';

import 'package:koder_animalts_app/core/widgets/screen_loader.dart';

class AssignRolePage extends ConsumerStatefulWidget {
  AssignRolePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignRolePage();
}

class _AssignRolePage extends ConsumerState<AssignRolePage> {
  @override
  Widget build(BuildContext context) {
    final roleState = ref.watch(selectedRoleProvider);
    final theme = ShadTheme.of(context);
    final isOwnerLoading = ref.watch(ownerProvider).isLoading;
    final isVeterinarianLoading = ref.watch(veterinarianProvider).isLoading;

    Future<void> assignRole() async {
      if (roleState.role == UserRole.OWNER) {
        if (roleState.contact.isEmpty || roleState.address.isEmpty) {
          ShadToaster.of(context).show(const ToastFieldsOwner());
          return;
        } else {
          try {
            await ref
                .read(ownerProvider.notifier)
                .createOwner(
                  CreateOwnerDto(
                    phone: roleState.contact,
                    address: roleState.address,
                    userId: ref.read(authProvider).value?['data'] as String,
                  ),
                );
          } catch (e) {
            return;
          }
        }
      } else if (roleState.role == UserRole.VETERINARIAN) {
        if (roleState.contact.isEmpty || roleState.clinicId.isEmpty) {
          ShadToaster.of(
            context,
          ).show(const ToastFieldsVeterinarian() as ShadToast);
          return;
        } else {
          try {
            await ref
                .read(veterinarianProvider.notifier)
                .createVeterinarian(
                  CreateVeterinarianDto(
                    phone: roleState.contact,
                    specialty: roleState.specialty,
                    userId: ref.read(authProvider).value!['data'] as String,
                    clinicId: roleState.clinicId,
                  ),
                );
          } catch (e) {
            return;
          }
        }
      }
      if (!mounted) return;
      context.go('/home');
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Logo
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'lib/assets/user_logo.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Selector
                  Text(
                    'Selecciona tu rol',
                    style: theme.textTheme.h3,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ShadSelect<UserRole>(
                      placeholder: const Text('Seleccionar rol'),
                      initialValue: roleState.role,
                      options: UserRole.values
                          .map(
                            (role) => ShadOption(
                              value: role,
                              child: Text(
                                UserRoleEntity(role: role).displayName,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          ref
                              .read(selectedRoleProvider.notifier)
                              .setRole(value);
                        }
                      },
                      selectedOptionBuilder: (context, value) {
                        return Text(UserRoleEntity(role: value).displayName);
                      },
                    ),
                  ),

                  if (roleState.role == UserRole.OWNER) const OwnerComponent(),

                  if (roleState.role == UserRole.VETERINARIAN)
                    const VeterinarianComponent(),

                  const SizedBox(height: 40),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: ShadButton(
                      onPressed: () => assignRole(),
                      text: const Text('Siguiente'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          if (isOwnerLoading || isVeterinarianLoading) const ScreenLoader(),
        ],
      ),
    );
  }
}
