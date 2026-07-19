import 'package:flutter_test/flutter_test.dart';

import 'package:aevum_iter/features/result/domain/services/result_calculator.dart';
import 'package:aevum_iter/features/test/domain/entities/test_question.dart';
import 'package:aevum_iter/features/test/domain/enums/riasec_type.dart';

void main() {
  group('ResultCalculator', () {
    late ResultCalculator calculator;
    late List<TestQuestion> questions;

    setUp(() {
      calculator = const ResultCalculator();

      questions = [
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'R$index',
            question: 'R$index',
            type: RiasecType.realistic,
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'I$index',
            question: 'I$index',
            type: RiasecType.investigative,
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'A$index',
            question: 'A$index',
            type: RiasecType.artistic,
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'S$index',
            question: 'S$index',
            type: RiasecType.social,
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'E$index',
            question: 'E$index',
            type: RiasecType.enterprising,
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: 'C$index',
            question: 'C$index',
            type: RiasecType.conventional,
          ),
        ),
      ];
    });

    test('calcula correctamente los porcentajes RIASEC', () {
      final answers = [
        ...List.filled(5, 10.0),
        ...List.filled(5, 8.0),
        ...List.filled(5, 6.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 0.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.realistic),
        100,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.investigative),
        80,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.artistic),
        60,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.social),
        40,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.enterprising),
        20,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.conventional),
        0,
      );
    });

    test('genera correctamente el código Holland', () {
      final answers = [
        ...List.filled(5, 10.0),
        ...List.filled(5, 8.0),
        ...List.filled(5, 6.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 0.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      expect(
        result.riasecScores.hollandCode,
        'RIA',
      );
    });

    test('ordena correctamente el ranking RIASEC', () {
      final answers = [
        ...List.filled(5, 10.0),
        ...List.filled(5, 8.0),
        ...List.filled(5, 6.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 0.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      final ranking = result.riasecScores.ranking;

      expect(ranking.first.key, RiasecType.realistic);
      expect(ranking.last.key, RiasecType.conventional);
    });

    test('las carreras se ordenan por compatibilidad', () {
      final answers = List.filled(30, 10.0);

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      for (var i = 0; i < result.careerMatches.length - 1; i++) {
        expect(
          result.careerMatches[i].compatibility,
          greaterThanOrEqualTo(
            result.careerMatches[i + 1].compatibility,
          ),
        );
      }
    });

    test('lanza excepción si preguntas y respuestas no coinciden', () {
      expect(
        () => calculator.calculate(
          questions: questions,
          answers: [],
        ),
        throwsArgumentError,
      );
    });

    test('limita respuestas fuera del rango permitido', () {
      final answers = [
        ...List.filled(5, 15.0),
        ...List.filled(5, -5.0),
        ...List.filled(20, 10.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.realistic),
        100,
      );

      expect(
        result.riasecScores.scoreOf(RiasecType.investigative),
        0,
      );
    });
  });
}