import '../../domain/entities/test_question.dart';
import '../../domain/enums/riasec_type.dart';

class TestRepository {
  const TestRepository();

  List<TestQuestion> getQuestions() {
    return [
      const TestQuestion(
        id: 'q1',
        question:
            '¿Te gustaría aprender a interpretar planos de construcción y estructuras arquitectónicas?',
        type: RiasecType.realistic,
      ),

      const TestQuestion(
        id: 'q2',
        question:
            '¿Disfrutas investigar cómo funcionan los fenómenos naturales?',
        type: RiasecType.investigative,
      ),

      const TestQuestion(
        id: 'q3',
        question:
            '¿Te gusta expresar tus ideas mediante el dibujo, la música o la escritura?',
        type: RiasecType.artistic,
      ),
    ]..shuffle();
  }
}