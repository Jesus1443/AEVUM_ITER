import 'package:flutter_test/flutter_test.dart';

import 'package:aevum_iter/features/result/domain/services/result_calculator.dart';
import 'package:aevum_iter/features/test/domain/entities/test_question.dart';
import 'package:aevum_iter/features/test/domain/enums/career.dart';
import 'package:aevum_iter/features/test/domain/enums/riasec_dimension.dart';

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
            id: index + 1,
            text: 'Pregunta realista ${index + 1}',
            dimension: RiasecDimension.realistic,
            careers: const [
              Career.civil,
              Career.electromechanical,
              Career.electronics,
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: index + 6,
            text: 'Pregunta investigadora ${index + 1}',
            dimension: RiasecDimension.investigative,
            careers: const [
              Career.biochemistry,
              Career.computerSystems,
              Career.informatics,
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: index + 11,
            text: 'Pregunta artística ${index + 1}',
            dimension: RiasecDimension.artistic,
            careers: const [
              Career.architecture,
              Career.applicationDevelopment,
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: index + 16,
            text: 'Pregunta social ${index + 1}',
            dimension: RiasecDimension.social,
            careers: const [
              Career.businessAdministration,
              Career.businessManagement,
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: index + 21,
            text: 'Pregunta emprendedora ${index + 1}',
            dimension: RiasecDimension.enterprising,
            careers: const [
              Career.businessAdministration,
              Career.businessManagement,
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => TestQuestion(
            id: index + 26,
            text: 'Pregunta convencional ${index + 1}',
            dimension: RiasecDimension.conventional,
            careers: const [
              Career.businessAdministration,
              Career.accounting,
            ],
          ),
        ),
      ];
    });

    test('calcula correctamente los porcentajes RIASEC', () {
      final answers = [
        ...List.filled(5, 5.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 3.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 1.0),
        ...List.filled(5, 1.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.realistic,
        ),
        100,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.investigative,
        ),
        75,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.artistic,
        ),
        50,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.social,
        ),
        25,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.enterprising,
        ),
        0,
      );

      expect(
        result.riasecScores.getScore(
          RiasecDimension.conventional,
        ),
        0,
      );
    });

    test('genera correctamente el código Holland', () {
      final answers = [
        ...List.filled(5, 5.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 3.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 1.0),
        ...List.filled(5, 1.0),
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
        ...List.filled(5, 5.0),
        ...List.filled(5, 4.0),
        ...List.filled(5, 3.0),
        ...List.filled(5, 2.0),
        ...List.filled(5, 1.0),
        ...List.filled(5, 1.0),
      ];

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      final ranking = result.riasecScores.sortedScores;

      expect(
        ranking.first.key,
        RiasecDimension.realistic,
      );

      expect(
        ranking.first.value,
        100,
      );

      expect(
        ranking.last.value,
        0,
      );
    });

    test('las carreras se ordenan por compatibilidad', () {
      final answers = List.filled(30, 5.0);

      final result = calculator.calculate(
        questions: questions,
        answers: answers,
      );

      for (
        var index = 0;
        index < result.careerMatches.length - 1;
        index++
      ) {
        expect(
          result.careerMatches[index].compatibility,
          greaterThanOrEqualTo(
            result.careerMatches[index + 1].compatibility,
          ),
        );
      }
    });

    test(
      'lanza excepción si preguntas y respuestas no coinciden',
      () {
        expect(
          () => calculator.calculate(
            questions: questions,
            answers: [],
          ),
          throwsArgumentError,
        );
      },
    );

    test('lanza excepción si una respuesta supera el máximo', () {
      final answers = List.filled(30, 5.0);
      answers[0] = 6.0;

      expect(
        () => calculator.calculate(
          questions: questions,
          answers: answers,
        ),
        throwsArgumentError,
      );
    });

    test('lanza excepción si una respuesta es menor al mínimo', () {
      final answers = List.filled(30, 5.0);
      answers[0] = 0.0;

      expect(
        () => calculator.calculate(
          questions: questions,
          answers: answers,
        ),
        throwsArgumentError,
      );
    });

    test('lanza excepción si no existen preguntas', () {
      expect(
        () => calculator.calculate(
          questions: const [],
          answers: const [],
        ),
        throwsArgumentError,
      );
    });
  });
}