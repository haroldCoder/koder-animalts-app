import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:koder_animalts_app/features/assign_role/domain/entities/user_role.dart';
import 'package:koder_animalts_app/features/assign_role/presentation/providers/role_provider.dart';

class AssignRolePage extends ConsumerWidget {
  const AssignRolePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(selectedRoleProvider);
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
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
                  initialValue: selectedRole,
                  options: UserRole.values
                      .map(
                        (role) => ShadOption(
                          value: role,
                          child: Text(UserRoleEntity(role: role).displayName),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(selectedRoleProvider.notifier).setRole(value);
                    }
                  },
                  selectedOptionBuilder: (context, value) {
                    return Text(UserRoleEntity(role: value).displayName);
                  },
                ),
              ),
              const Spacer(),

              // Button
              Align(
                alignment: Alignment.bottomRight,
                child: ShadButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  text: const Text('Siguiente'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
