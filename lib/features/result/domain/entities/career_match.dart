import 'career_profile.dart';

class CareerMatch {
  const CareerMatch({
    required this.career,
    required this.compatibility,
  });

  final CareerProfile career;

  /// Porcentaje entre 0 y 100.
  final double compatibility;
}