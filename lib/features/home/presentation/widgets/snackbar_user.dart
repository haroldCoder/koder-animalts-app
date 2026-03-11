import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:koder_animalts_app/features/user/presentation/providers/user_provider.dart';
import 'package:koder_animalts_app/features/user/domain/entities/user.dart';

class SnackbarUser extends ConsumerWidget {
  const SnackbarUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final userState = ref.watch(userProvider);

    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, MMMM d', 'es').format(now);

    return userState.when(
      loading: () => _buildSkeleton(theme),
      error: (_, __) => _buildSkeleton(theme),
      data: (user) => _buildContent(
        context: context,
        theme: theme,
        user: user,
        formattedDate: formattedDate,
      ),
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required ShadThemeData theme,
    required User? user,
    required String formattedDate,
  }) {
    final greeting = _buildGreeting(user);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formattedDate,
              style: theme.textTheme.muted.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              greeting,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        ShadAvatar(
          user?.image ?? '',
          placeholder: const Icon(Icons.person),
          size: const Size(38, 38),
        ),
      ],
    );
  }

  String _buildGreeting(User? user) {
    if (user == null) return 'Hola!';

    final firstName = user.name.split(' ').first;

    switch (user.role) {
      case RoleEnum.VETERINARIAN:
        return 'Hola, Dr. $firstName 👋';
      case RoleEnum.OWNER:
      default:
        return 'Hola, $firstName 👋';
    }
  }

  Widget _buildSkeleton(ShadThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 12,
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 180,
              height: 20,
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: theme.colorScheme.muted,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
