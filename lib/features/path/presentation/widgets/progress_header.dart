import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../avatar/data/avatar_repository.dart';
import '../../../profile/presentation/providers/user_profile_provider.dart';

/// Encabezado del recorrido con acceso directo al perfil del usuario.
class ProgressHeader extends ConsumerWidget {
  const ProgressHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final avatar = profile == null
        ? null
        : const AvatarRepository().getById(profile.avatarId);

    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.sm,
        bottom: AppSpacing.lg,
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => context.push(AppRoutes.profile),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary.withValues(alpha: .12),
              backgroundImage:
                  avatar == null ? null : AssetImage(avatar.image),
              child: avatar == null
                  ? const Icon(
                      Icons.person,
                      color: AppColors.primaryDark,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              '¡Hola, ${profile?.name ?? 'Usuario'}!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Ver perfil',
            onPressed: () => context.push(AppRoutes.profile),
            icon: const Icon(
              Icons.account_circle_outlined,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
