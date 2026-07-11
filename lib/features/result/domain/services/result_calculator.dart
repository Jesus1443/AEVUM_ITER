import '../../../test/domain/entities/test_question.dart';
import '../../../test/domain/enums/riasec_type.dart';
import '../../data/repositories/career_repository.dart';
import '../entities/career_match.dart';
import '../entities/career_profile.dart';
import '../entities/riasec_scores.dart';
import '../entities/test_result.dart';

class ResultCalculator {
  const ResultCalculator({
    this.maximumAnswer = 10,
    this.questionsPerType = 5,
  });

  final double maximumAnswer;
  final int questionsPerType;

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
    final totals = <RiasecType, double>{
      for (final type in RiasecType.values) type: 0,
    };

    final counts = <RiasecType, int>{
      for (final type in RiasecType.values) type: 0,
    };

    for (var index = 0; index < questions.length; index++) {
      final question = questions[index];
      final answer = answers[index].clamp(0, maximumAnswer).toDouble();

      totals[question.type] = totals[question.type]! + answer;
      counts[question.type] = counts[question.type]! + 1;
    }

    final normalized = <RiasecType, double>{};

    for (final type in RiasecType.values) {
      final answeredForType = counts[type] ?? 0;

      if (answeredForType == 0) {
        normalized[type] = 0;
        continue;
      }

      final maximumPossible = answeredForType * maximumAnswer;
      final rawScore = totals[type] ?? 0;

      normalized[type] = (rawScore / maximumPossible) * 100;
    }

    return RiasecScores(
      values: Map.unmodifiable(normalized),
    );
  }

  List<CareerMatch> _calculateCareerMatches(
    RiasecScores scores,
  ) {
    final careers = const CareerRepository().getCareers();

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
        (a, b) => b.compatibility.compareTo(a.compatibility),
      );

    return List.unmodifiable(matches);
  }

  double _compatibilityFor({
    required RiasecScores scores,
    required CareerProfile career,
  }) {
    var weightedScore = 0.0;
    var totalWeight = 0.0;

    for (final type in RiasecType.values) {
      final weight = career.weightOf(type);

      weightedScore += scores.scoreOf(type) * weight;
      totalWeight += weight;
    }

    if (totalWeight == 0) return 0;

    return weightedScore / totalWeight;
  }
}