import '../../../test/domain/enums/riasec_dimension.dart';

class RiasecScores {
  const RiasecScores({
    required this.realistic,
    required this.investigative,
    required this.artistic,
    required this.social,
    required this.enterprising,
    required this.conventional,
  });

  final double realistic;
  final double investigative;
  final double artistic;
  final double social;
  final double enterprising;
  final double conventional;

  double getScore(RiasecDimension dimension) {
    switch (dimension) {
      case RiasecDimension.realistic:
        return realistic;
      case RiasecDimension.investigative:
        return investigative;
      case RiasecDimension.artistic:
        return artistic;
      case RiasecDimension.social:
        return social;
      case RiasecDimension.enterprising:
        return enterprising;
      case RiasecDimension.conventional:
        return conventional;
    }
  }

  Map<RiasecDimension, double> toMap() {
    return {
      RiasecDimension.realistic: realistic,
      RiasecDimension.investigative: investigative,
      RiasecDimension.artistic: artistic,
      RiasecDimension.social: social,
      RiasecDimension.enterprising: enterprising,
      RiasecDimension.conventional: conventional,
    };
  }

  List<MapEntry<RiasecDimension, double>> get sortedScores {
    final scores = toMap().entries.toList();

    scores.sort(
      (a, b) => b.value.compareTo(a.value),
    );

    return List.unmodifiable(scores);
  }

  RiasecDimension get dominantDimension {
    return sortedScores.first.key;
  }

  List<RiasecDimension> get topThreeDimensions {
    return sortedScores
        .take(3)
        .map((entry) => entry.key)
        .toList(growable: false);
  }

  String get hollandCode {
    return topThreeDimensions
        .map(_letterForDimension)
        .join();
  }

  String _letterForDimension(
    RiasecDimension dimension,
  ) {
    switch (dimension) {
      case RiasecDimension.realistic:
        return 'R';
      case RiasecDimension.investigative:
        return 'I';
      case RiasecDimension.artistic:
        return 'A';
      case RiasecDimension.social:
        return 'S';
      case RiasecDimension.enterprising:
        return 'E';
      case RiasecDimension.conventional:
        return 'C';
    }
  }
}