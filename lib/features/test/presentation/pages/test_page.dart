import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/enums/test_flow_status.dart';
import '../providers/test_provider.dart';
import '../widgets/answer_slider.dart';
import '../widgets/question_card.dart';
import '../widgets/test_progress_header.dart';

class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  ConsumerState<TestPage> createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<TestPage> {
  ProviderSubscription? _testSubscription;

  @override
  void initState() {
    super.initState();

    _testSubscription = ref.listenManual(
      testProvider,
      (previous, next) {
        if (!mounted || previous?.status == next.status) {
          return;
        }

        switch (next.status) {
          case TestFlowStatus.answering:
            break;

          case TestFlowStatus.blockCompleted:
            context.go(AppRoutes.path);
            break;

          case TestFlowStatus.finished:
            context.go(AppRoutes.result);
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _testSubscription?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(testProvider);
    final notifier = ref.read(testProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              TestProgressHeader(
                currentQuestion: state.currentIndex + 1,
                totalQuestions: state.totalQuestions,
              ),
              const SizedBox(height: AppSpacing.xl),
              QuestionCard(
                question: state.currentQuestion.question,
              ),
              const SizedBox(height: AppSpacing.xl),
              AnswerSlider(
                value: state.currentValue,
                onChanged: notifier.updateValue,
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: notifier.nextQuestion,
                  child: Text(
                    state.currentIndex == state.totalQuestions - 1
                        ? 'Finalizar'
                        : 'Continuar',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      
                    ),
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