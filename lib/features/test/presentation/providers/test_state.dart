import '../../domain/entities/test_question.dart';
import '../../domain/enums/test_flow_status.dart';

class TestState {
  const TestState({
    required this.questions,
    required this.currentIndex,
    required this.answers,
    required this.currentValue,
    required this.status,
  });

  final List<TestQuestion> questions;
  final int currentIndex;
  final List<double> answers;
  final double currentValue;
  final TestFlowStatus status;

  TestQuestion get currentQuestion => questions[currentIndex];

  double get progress => (currentIndex + 1) / questions.length;

  bool get isBlockCompleted => status == TestFlowStatus.blockCompleted;

  bool get isFinished => status == TestFlowStatus.finished;

  TestState copyWith({
    List<TestQuestion>? questions,
    int? currentIndex,
    List<double>? answers,
    double? currentValue,
    TestFlowStatus? status,
  }) {
    return TestState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      currentValue: currentValue ?? this.currentValue,
      status: status ?? this.status,
    );
  }
}