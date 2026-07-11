import 'career_match.dart';
import 'riasec_scores.dart';

class TestResult {
  const TestResult({
    required this.riasecScores,
    required this.careerMatches,
  });

  final RiasecScores riasecScores;
  final List<CareerMatch> careerMatches;

  CareerMatch get bestMatch => careerMatches.first;

  List<CareerMatch> get topThreeCareers {
    return careerMatches.take(3).toList();
  }
}