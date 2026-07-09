import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../test/presentation/providers/test_provider.dart';
import '../../data/repositories/path_repository.dart';
import '../widgets/path_timeline.dart';
import '../widgets/progress_bar.dart';
import '../widgets/progress_header.dart';

class PathPage extends ConsumerWidget {
  const PathPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testState = ref.watch(testProvider);
    final completedQuestions = testState.answers.length;
    final isFinished = completedQuestions >= 30;

    return AppScreen(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          children: [
            const ProgressHeader(),
            const SizedBox(height: AppSpacing.md),
            ProgressBar(
              completedQuestions: completedQuestions,
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: PathTimeline(
                nodes: const PathRepository().getNodes(),
                completedQuestions: completedQuestions,
              ),
            ),
            PrimaryButton(
              text: isFinished ? 'Ver resultado' : 'Continuar Prueba',
              icon: isFinished
                  ? Icons.emoji_events_rounded
                  : Icons.arrow_forward_rounded,
              onPressed: () {
                if (isFinished) {
                  context.go(AppRoutes.result);
                  return;
                }

                ref.read(testProvider.notifier).continueTest();
                context.go(AppRoutes.test);
              },
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              isFinished
                  ? 'Tu perfil vocacional está listo.'
                  : 'Próximo paso: continúa descubriendo tu camino.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}