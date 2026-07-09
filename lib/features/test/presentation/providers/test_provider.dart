import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/test_repository.dart';
import '../../domain/enums/test_flow_status.dart';
import 'test_state.dart';

final testProvider = NotifierProvider<TestNotifier, TestState>(
  TestNotifier.new,
);

class TestNotifier extends Notifier<TestState> {
  @override
  TestState build() {
    return TestState(
      questions: const TestRepository().getQuestions(),
      currentIndex: 0,
      answers: const [],
      currentValue: 5,
      status: TestFlowStatus.answering,
    );
  }

  void updateValue(double value) {
    state = state.copyWith(
      currentValue: value,
    );
  }

  void nextQuestion() {
    final answers = [
      ...state.answers,
      state.currentValue,
    ];

    final nextIndex = state.currentIndex + 1;

    if (nextIndex >= state.questions.length) {
      state = state.copyWith(
        answers: answers,
        status: TestFlowStatus.finished,
      );
      return;
    }

    if (nextIndex % 5 == 0) {
      state = state.copyWith(
        currentIndex: nextIndex,
        answers: answers,
        currentValue: 5,
        status: TestFlowStatus.blockCompleted,
      );
      return;
    }

    state = state.copyWith(
      currentIndex: nextIndex,
      answers: answers,
      currentValue: 5,
      status: TestFlowStatus.answering,
    );
  }

  void continueTest() {
    state = state.copyWith(
      status: TestFlowStatus.answering,
    );
  }

  void reset() {
    state = TestState(
      questions: const TestRepository().getQuestions(),
      currentIndex: 0,
      answers: const [],
      currentValue: 5,
      status: TestFlowStatus.answering,
    );
  }
}