import '../enums/riasec_level.dart';

extension RiasecLevelExtension on RiasecLevel {
  String get title {
    switch (this) {
      case RiasecLevel.veryHigh:
        return 'Muy alto';

      case RiasecLevel.high:
        return 'Alto';

      case RiasecLevel.moderate:
        return 'Moderado';

      case RiasecLevel.low:
        return 'Bajo';

      case RiasecLevel.veryLow:
        return 'Muy bajo';
    }
  }

  String get description {
    switch (this) {
      case RiasecLevel.veryHigh:
        return 'Esta dimensión representa una de tus principales fortalezas.';

      case RiasecLevel.high:
        return 'Presentas una afinidad importante por este perfil.';

      case RiasecLevel.moderate:
        return 'Forma parte de tus intereses, aunque no es dominante.';

      case RiasecLevel.low:
        return 'Tiene poca influencia dentro de tu perfil vocacional.';

      case RiasecLevel.veryLow:
        return 'Actualmente esta dimensión casi no forma parte de tus preferencias.';
    }
  }
}