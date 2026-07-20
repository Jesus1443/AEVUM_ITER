import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../avatar/data/avatar_repository.dart';
import '../providers/user_profile_provider.dart';
import '../widgets/profile_result_summary.dart';

/// Pantalla principal del perfil local.
///
/// No incluye historial ni un botón para repetir el test, de acuerdo con el
/// alcance definido para esta versión de AEVUM ITER.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    if (profile == null) {
      return AppScreen(
        child: SafeArea(
          child: Center(
            child: PrimaryButton(
              text: 'Crear perfil',
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => context.go(AppRoutes.avatarSelection),
            ),
          ),
        ),
      );
    }

    final avatar = const AvatarRepository().getById(profile.avatarId);

    return AppScreen(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTopBar(
                onBack: () => context.go(AppRoutes.path),
              ),
              const SizedBox(height: AppSpacing.lg),
              const AppTitle('Mi perfil', fontSize: 34),
              const SizedBox(height: AppSpacing.xl),
              Center(
                child: CircleAvatar(
                  radius: 72,
                  backgroundColor:
                      AppColors.primary.withValues(alpha: 0.12),
                  backgroundImage:
                      avatar == null ? null : AssetImage(avatar.image),
                  child: avatar == null
                      ? const Icon(
                          Icons.person,
                          size: 72,
                          color: AppColors.primary,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                profile.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '${profile.age} años',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              ProfileResultSummary(profile: profile),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                text: 'Editar perfil',
                icon: Icons.edit_rounded,
                onPressed: () => context.push(AppRoutes.editProfile),
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                text: 'Acerca de AEVUM ITER',
                icon: Icons.info_outline_rounded,
                onPressed: () => showAboutDialog(
                  context: context,
                  applicationName: 'AEVUM ITER',
                  applicationVersion: '1.0.0',
                  children: const [
                    Text(
                      'Aplicación de orientación vocacional basada en el '
                      'modelo RIASEC de Holland.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
