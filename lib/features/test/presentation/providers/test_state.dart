import '../../../result/domain/entities/test_result.dart';
import '../../domain/entities/test_question.dart';
import '../../domain/enums/test_flow_status.dart';

class TestState {
  const TestState({
    required this.questions,
    required this.currentIndex,
    required this.answers,
    required this.currentValue,
    required this.status,
    this.result,
  });

  final List<TestQuestion> questions;
  final int currentIndex;
  final List<double> answers;
  final double currentValue;
  final TestFlowStatus status;
  final TestResult? result;

  TestQuestion get currentQuestion => questions[currentIndex];

  int get answeredQuestions => answers.length;

  int get totalQuestions => questions.length;

  double get progress {
    if (questions.isEmpty) return 0;

    return answers.length / questions.length;
  }

  bool get isBlockCompleted {
    return status == TestFlowStatus.blockCompleted;
  }

  bool get isFinished {
    return status == TestFlowStatus.finished;
  }

  bool get hasResult => result != null;

  TestState copyWith({
    List<TestQuestion>? questions,
    int? currentIndex,
    List<double>? answers,
    double? currentValue,
    TestFlowStatus? status,
    TestResult? result,
    bool clearResult = false,
  }) {
    return TestState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      currentValue: currentValue ?? this.currentValue,
      status: status ?? this.status,
      result: clearResult ? null : result ?? this.result,
    );
  }
}