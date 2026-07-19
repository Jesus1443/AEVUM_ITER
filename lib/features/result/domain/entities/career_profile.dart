import '../../../test/domain/enums/career.dart';
import '../../../test/domain/enums/riasec_dimension.dart';

class CareerProfile {
  const CareerProfile({
    required this.career,
    required this.name,
    required this.description,
    required this.dimensions,
  });

  final Career career;

  final String name;

  final String description;

  final List<RiasecDimension> dimensions;
}