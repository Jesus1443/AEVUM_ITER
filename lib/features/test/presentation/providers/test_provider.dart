import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../result/domain/services/result_calculator.dart';
import '../../data/repositories/test_repository.dart';
import '../../domain/enums/test_flow_status.dart';
import 'test_state.dart';

final testProvider = NotifierProvider<TestNotifier, TestState>(
  TestNotifier.new,
);

class TestNotifier extends Notifier<TestState> {
  static const double _defaultAnswer = 5;

  @override
  TestState build() {
    return _createInitialState();
  }

  void updateValue(double value) {
    state = state.copyWith(
      currentValue: value.clamp(0, 10).toDouble(),
    );
  }

  void nextQuestion() {
    if (state.status != TestFlowStatus.answering) {
      return;
    }

    final updatedAnswers = [
      ...state.answers,
      state.currentValue,
    ];

    final nextIndex = state.currentIndex + 1;

    if (nextIndex >= state.questions.length) {
      final result = const ResultCalculator().calculate(
        questions: state.questions,
        answers: updatedAnswers,
      );

      state = state.copyWith(
        answers: List.unmodifiable(updatedAnswers),
        status: TestFlowStatus.finished,
        result: result,
      );

      return;
    }

    final hasCompletedBlock = nextIndex % 5 == 0;

    state = state.copyWith(
      currentIndex: nextIndex,
      answers: List.unmodifiable(updatedAnswers),
      currentValue: _defaultAnswer,
      status: hasCompletedBlock
          ? TestFlowStatus.blockCompleted
          : TestFlowStatus.answering,
    );
  }

  void continueTest() {
    if (state.status != TestFlowStatus.blockCompleted) {
      return;
    }

    state = state.copyWith(
      status: TestFlowStatus.answering,
    );
  }

  void reset() {
    state = _createInitialState();
  }

  TestState _createInitialState() {
    return TestState(
      questions: const TestRepository().getQuestions(),
      currentIndex: 0,
      answers: const [],
      currentValue: _defaultAnswer,
      status: TestFlowStatus.answering,
      result: null,
    );
  }
}