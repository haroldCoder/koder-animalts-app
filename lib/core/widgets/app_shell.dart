import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koder_animalts_app/core/widgets/nav_footer.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavFooter(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
