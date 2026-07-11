import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../test/presentation/providers/test_provider.dart';
import '../../domain/entities/career_match.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testState = ref.watch(testProvider);
    final result = testState.result;

    if (result == null) {
      return AppScreen(
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
      );
    }

    final bestMatch = result.bestMatch;
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
                'Esta es la carrera que presenta mayor compatibilidad con tus respuestas.',
              ),

              const SizedBox(height: AppSpacing.xl),

              _BestCareerCard(
                match: bestMatch,
                hollandCode: result.riasecScores.hollandCode,
              ),

              const SizedBox(height: AppSpacing.xl),

              const Text(
                'TUS MEJORES OPCIONES',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3,
                  color: AppColors.primaryDark,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              for (var index = 0; index < topCareers.length; index++) ...[
                _CareerRankingCard(
                  position: index + 1,
                  match: topCareers[index],
                ),
                if (index < topCareers.length - 1)
                  const SizedBox(height: AppSpacing.md),
              ],

              const SizedBox(height: AppSpacing.xl),

              PrimaryButton(
                text: 'Ir al inicio',
                icon: Icons.home_rounded,
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
            ],
          ),
        ),
      ),
    );
  }
}

class _BestCareerCard extends StatelessWidget {
  const _BestCareerCard({
    required this.match,
    required this.hollandCode,
  });

  final CareerMatch match;
  final String hollandCode;

  @override
  Widget build(BuildContext context) {
    final percentage = match.compatibility.clamp(0, 100).round();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: .22),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -16,
            bottom: -22,
            child: Icon(
              Icons.workspace_premium_rounded,
              size: 130,
              color: Colors.white.withValues(alpha: .08),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MAYOR COMPATIBILIDAD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                match.career.name,
                style: const TextStyle(
                  fontSize: 28,
                  height: 1.15,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .14),
                      borderRadius:
                          BorderRadius.circular(AppRadius.circular),
                    ),
                    child: Text(
                      'Código Holland: $hollandCode',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.circular),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: percentage / 100,
                  backgroundColor: Colors.white.withValues(alpha: .16),
                  valueColor: const AlwaysStoppedAnimation(
                    AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CareerRankingCard extends StatelessWidget {
  const _CareerRankingCard({
    required this.position,
    required this.match,
  });

  final int position;
  final CareerMatch match;

  @override
  Widget build(BuildContext context) {
    final percentage = match.compatibility.clamp(0, 100).round();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .16),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$position',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              match.career.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}