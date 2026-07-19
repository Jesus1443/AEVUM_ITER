import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../test/presentation/providers/test_provider.dart';
import '../widgets/best_career_card.dart';
import '../widgets/career_ranking_card.dart';
import '../widgets/environments_card.dart';
import '../widgets/interests_card.dart';
import '../widgets/profile_card.dart';
import '../widgets/riasec_scores_card.dart';
import '../widgets/strengths_card.dart';
import '../widgets/riasec_radar_card.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testState = ref.watch(testProvider);
    final result = testState.result;

    if (result == null) {
      return AppScreen(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 72,
                  color: AppColors.textMuted,
                ),
                const SizedBox(height: AppSpacing.lg),
                const AppTitle(
                  'Resultado no disponible',
                  fontSize: 28,
                ),
                const SizedBox(height: AppSpacing.md),
                const AppSubtitle(
                  'Completa las 30 preguntas para obtener tu recomendación.',
                ),
                const SizedBox(height: AppSpacing.xl),
                PrimaryButton(
                  text: 'Continuar prueba',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () => context.go(AppRoutes.test),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final mainProfile = result.mainProfile;
    final topCareers = result.topThreeCareers;

    return AppScreen(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppTopBar(
                showBackButton: false,
              ),
              const SizedBox(height: AppSpacing.lg),
              const AppTitle(
                '¡Descubriste tu camino!',
                fontSize: 32,
              ),
              const SizedBox(height: AppSpacing.sm),
              const AppSubtitle(
                'Conoce tu perfil vocacional y las carreras del Tecnológico '
                'que presentan mayor compatibilidad contigo.',
              ),
              const SizedBox(height: AppSpacing.xl),

              BestCareerCard(
                match: result.bestMatch,
                hollandCode: result.riasecScores.hollandCode,
              ),

              const SizedBox(height: AppSpacing.xl),

              RiasecRadarCard(
                scores: result.riasecScores,
              ),

              const SizedBox(height: AppSpacing.lg),

              RiasecScoresCard(
                scores: result.riasecScores,
              ),

              const SizedBox(height: AppSpacing.lg),

              ProfileCard(
                profile: mainProfile,
              ),

              const SizedBox(height: AppSpacing.lg),

              StrengthsCard(
                strengths: mainProfile.strengths,
              ),

              const SizedBox(height: AppSpacing.lg),

              InterestsCard(
                interests: mainProfile.interests,
              ),

              const SizedBox(height: AppSpacing.lg),

              EnvironmentsCard(
                environments: mainProfile.workEnvironments,
              ),

              const SizedBox(height: AppSpacing.xl),

              const Text(
                'CARRERAS DEL TECNOLÓGICO RECOMENDADAS',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: AppColors.primaryDark,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              for (var index = 0;
                  index < topCareers.length;
                  index++) ...[
                CareerRankingCard(
                  position: index + 1,
                  match: topCareers[index],
                ),
                if (index < topCareers.length - 1)
                  const SizedBox(height: AppSpacing.md),
              ],

              const SizedBox(height: AppSpacing.xl),

              PrimaryButton(
                text: 'Ir al recorrido',
                icon: Icons.route_rounded,
                onPressed: () => context.go(AppRoutes.path),
              ),

              const SizedBox(height: AppSpacing.md),

              TextButton(
                onPressed: () {
                  ref.read(testProvider.notifier).reset();
                  context.go(AppRoutes.test);
                },
                child: const Text(
                  'REALIZAR PRUEBA DE NUEVO',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}