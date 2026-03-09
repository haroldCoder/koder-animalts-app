import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koder_animalts_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: ShadButton(
          text: const Text("Close session"),
          onPressed: () {
            ref.read(authProvider.notifier).logOut();
          },
        ),
      ),
    );
  }
}
