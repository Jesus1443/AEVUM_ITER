import '../../../test/domain/entities/test_question.dart';
import '../../../test/domain/enums/riasec_dimension.dart';
import '../../data/repositories/career_repository.dart';
import '../entities/career_match.dart';
import '../entities/career_profile.dart';
import '../entities/riasec_scores.dart';
import '../entities/test_result.dart';

class ResultCalculator {
  const ResultCalculator({
    this.minimumAnswer = 0,
    this.maximumAnswer = 10,
  });

  final double minimumAnswer;
  final double maximumAnswer;

  TestResult calculate({
    required List<TestQuestion> questions,
    required List<double> answers,
  }) {
    if (questions.length != answers.length) {
      throw ArgumentError(
        'La cantidad de preguntas y respuestas debe ser igual.',
      );
    }

    if (questions.isEmpty) {
      throw ArgumentError(
        'No se puede calcular un resultado sin preguntas.',
      );
    }

    if (maximumAnswer <= minimumAnswer) {
      throw ArgumentError(
        'El valor máximo de respuesta debe ser mayor que el mínimo.',
      );
    }

    final riasecScores = _calculateRiasecScores(
      questions: questions,
      answers: answers,
    );

    final matches = _calculateCareerMatches(riasecScores);

    return TestResult(
      riasecScores: riasecScores,
      careerMatches: matches,
    );
  }

  RiasecScores _calculateRiasecScores({
    required List<TestQuestion> questions,
    required List<double> answers,
  }) {
    final totals = <RiasecDimension, double>{
      for (final dimension in RiasecDimension.values)
        dimension: 0,
    };

    final counts = <RiasecDimension, int>{
      for (final dimension in RiasecDimension.values)
        dimension: 0,
    };

    for (var index = 0; index < questions.length; index++) {
      final question = questions[index];
      final answer = answers[index];

      if (answer < minimumAnswer || answer > maximumAnswer) {
        throw ArgumentError(
          'La respuesta de la pregunta ${question.id} '
          'debe estar entre $minimumAnswer y $maximumAnswer.',
        );
      }

      totals[question.dimension] =
          totals[question.dimension]! + answer;

      counts[question.dimension] =
          counts[question.dimension]! + 1;
    }

    final normalized = <RiasecDimension, double>{
      for (final dimension in RiasecDimension.values)
        dimension: _normalizeScore(
          total: totals[dimension]!,
          questionCount: counts[dimension]!,
        ),
    };

    return RiasecScores(
      realistic:
          normalized[RiasecDimension.realistic] ?? 0,
      investigative:
          normalized[RiasecDimension.investigative] ?? 0,
      artistic:
          normalized[RiasecDimension.artistic] ?? 0,
      social:
          normalized[RiasecDimension.social] ?? 0,
      enterprising:
          normalized[RiasecDimension.enterprising] ?? 0,
      conventional:
          normalized[RiasecDimension.conventional] ?? 0,
    );
  }

  double _normalizeScore({
    required double total,
    required int questionCount,
  }) {
    if (questionCount == 0) {
      return 0;
    }

    final minimumPossible =
        questionCount * minimumAnswer;

    final maximumPossible =
        questionCount * maximumAnswer;

    final normalized =
        (total - minimumPossible) /
        (maximumPossible - minimumPossible);

    return (normalized * 100)
        .clamp(0.0, 100.0)
        .toDouble();
  }

  List<CareerMatch> _calculateCareerMatches(
    RiasecScores scores,
  ) {
    final careers =
        const CareerRepository().getCareers();

    final matches = careers.map((career) {
      return CareerMatch(
        career: career,
        compatibility: _compatibilityFor(
          scores: scores,
          career: career,
        ),
      );
    }).toList()
      ..sort(
        (a, b) =>
            b.compatibility.compareTo(a.compatibility),
      );

    return List.unmodifiable(matches);
  }

  double _compatibilityFor({
    required RiasecScores scores,
    required CareerProfile career,
  }) {
    if (career.dimensions.isEmpty) {
      return 0;
    }

    var totalScore = 0.0;

    for (final dimension in career.dimensions) {
      totalScore += scores.getScore(dimension);
    }

    return totalScore / career.dimensions.length;
  }
}