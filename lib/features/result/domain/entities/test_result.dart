import '../../../test/domain/enums/riasec_dimension.dart';
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

  CareerMatch get bestMatch {
    if (careerMatches.isEmpty) {
      throw StateError(
        'No existen coincidencias de carreras en el resultado.',
      );
    }

    return careerMatches.first;
  }

  List<CareerMatch> get topThreeCareers {
    return careerMatches
        .take(3)
        .toList(growable: false);
  }

  List<RiasecDimension> get dominantTypes {
    return riasecScores.topThreeDimensions;
  }

  List<RiasecProfile> get dominantProfiles {
    const repository = RiasecProfileRepository();

    return dominantTypes
        .map(repository.getProfile)
        .toList(growable: false);
  }

  RiasecProfile get mainProfile {
    const repository = RiasecProfileRepository();

    return repository.getProfile(
      riasecScores.dominantDimension,
    );
  }
}