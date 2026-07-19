import '../../../test/domain/enums/riasec_type.dart';

class RiasecProfile {
  const RiasecProfile({
    required this.type,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.strengths,
    required this.interests,
    required this.workEnvironments,
  });

  final RiasecType type;
  final String name;
  final String shortDescription;
  final String description;
  final List<String> strengths;
  final List<String> interests;
  final List<String> workEnvironments;
}