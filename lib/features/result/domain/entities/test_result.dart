import '../../../test/domain/enums/riasec_type.dart';
import '../../data/repositories/riasec_profile_repository.dart';
import 'career_match.dart';
import 'riasec_profile.dart';
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

  List<RiasecType> get dominantTypes {
    return riasecScores.ranking
        .take(3)
        .map((entry) => entry.key)
        .toList();
  }

  List<RiasecProfile> get dominantProfiles {
    const repository = RiasecProfileRepository();

    return dominantTypes
        .map(repository.getProfile)
        .toList();
  }

  RiasecProfile get mainProfile {
    const repository = RiasecProfileRepository();

    return repository.getProfile(
      riasecScores.ranking.first.key,
    );
  }
}