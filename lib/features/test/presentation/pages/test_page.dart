import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../providers/test_provider.dart';
import '../widgets/answer_slider.dart';
import '../widgets/question_card.dart';
import '../widgets/test_progress_header.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                totalQuestions: state.questions.length,
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
                  onPressed: () {
                    notifier.nextQuestion();
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
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