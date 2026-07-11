import '../../../test/domain/enums/riasec_type.dart';

class CareerProfile {
  const CareerProfile({
    required this.id,
    required this.name,
    required this.weights,
  });

  final String id;
  final String name;
  final Map<RiasecType, double> weights;

  double weightOf(RiasecType type) {
    return weights[type] ?? 0;
  }
}