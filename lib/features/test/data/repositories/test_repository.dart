import '../../domain/entities/test_question.dart';
import '../../domain/enums/riasec_type.dart';

class TestRepository {
  const TestRepository();

  List<TestQuestion> getQuestions() {
    final questions = List.generate(
      30,
      (index) => TestQuestion(
        id: 'q${index + 1}',
        question: 'Pregunta temporal ${index + 1}',
        type: RiasecType.values[index % RiasecType.values.length],
      ),
    );

    questions.shuffle();

    return questions;
  }
}