import '../../../test/domain/enums/riasec_type.dart';
import '../enums/riasec_level.dart';

class RiasecScores {
  const RiasecScores({
    required this.values,
  });

  final Map<RiasecType, double> values;

  double scoreOf(RiasecType type) {
    return values[type] ?? 0;
  }

  List<MapEntry<RiasecType, double>> get ranking {
    final sorted = values.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted;
  }

  List<RiasecType> get topThree {
    return ranking.take(3).map((entry) => entry.key).toList();
  }

  String get hollandCode {
    return topThree.map(_letterOf).join();
  }

  String _letterOf(RiasecType type) {
    return switch (type) {
      RiasecType.realistic => 'R',
      RiasecType.investigative => 'I',
      RiasecType.artistic => 'A',
      RiasecType.social => 'S',
      RiasecType.enterprising => 'E',
      RiasecType.conventional => 'C',
    };
  }

  RiasecLevel levelOf(RiasecType type) {
    final value = scoreOf(type);

    if (value >= 90) {
      return RiasecLevel.veryHigh;
    }

    if (value >= 75) {
      return RiasecLevel.high;
    }

    if (value >= 60) {
      return RiasecLevel.moderate;
    }

    if (value >= 40) {
      return RiasecLevel.low;
    }

    return RiasecLevel.veryLow;
  }
}