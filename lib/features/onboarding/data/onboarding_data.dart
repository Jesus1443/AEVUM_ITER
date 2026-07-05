import '../../../core/constants/app_assets.dart';
import '../domain/entities/onboarding_item.dart';

class OnboardingData {
  OnboardingData._();

  static const List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Tu futuro empieza aquí',
      description:
          'Descubre las carreras que mejor se adaptan a tus intereses, habilidades y personalidad.',
      image: AppAssets.onboarding1,
    ),
    OnboardingItem(
      title: 'Aprende sobre ti',
      description:
          'Responde un test vocacional basado en el modelo RIASEC y conoce tus fortalezas.',
      image: AppAssets.onboarding2,
    ),
    OnboardingItem(
      title: 'Logra tus metas',
      description:
          'Obtén recomendaciones personalizadas y comienza a construir tu camino profesional.',
      image: AppAssets.onboarding3,
    ),
  ];
}