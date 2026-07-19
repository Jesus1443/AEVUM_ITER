import '../enums/career.dart';
import '../enums/riasec_dimension.dart';

class TestQuestion {
  const TestQuestion({
    required this.id,
    required this.text,
    required this.dimension,
    required this.careers,
  });

  final int id;
  final String text;
  final RiasecDimension dimension;
  final List<Career> careers;
}