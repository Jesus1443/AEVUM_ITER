import '../../../test/domain/enums/riasec_type.dart';
import '../../domain/entities/career_profile.dart';

class CareerRepository {
  const CareerRepository();

  List<CareerProfile> getCareers() {
    return const [
      CareerProfile(
        id: 'computer_systems',
        name: 'Ingeniería en Sistemas Computacionales',
        weights: {
          RiasecType.realistic: 0.70,
          RiasecType.investigative: 1.00,
          RiasecType.artistic: 0.35,
          RiasecType.social: 0.30,
          RiasecType.enterprising: 0.45,
          RiasecType.conventional: 0.75,
        },
      ),
      CareerProfile(
        id: 'informatics',
        name: 'Informática',
        weights: {
          RiasecType.realistic: 0.55,
          RiasecType.investigative: 0.90,
          RiasecType.artistic: 0.40,
          RiasecType.social: 0.45,
          RiasecType.enterprising: 0.55,
          RiasecType.conventional: 0.85,
        },
      ),
      CareerProfile(
        id: 'electromechanics',
        name: 'Ingeniería Electromecánica',
        weights: {
          RiasecType.realistic: 1.00,
          RiasecType.investigative: 0.85,
          RiasecType.artistic: 0.20,
          RiasecType.social: 0.25,
          RiasecType.enterprising: 0.40,
          RiasecType.conventional: 0.65,
        },
      ),
      CareerProfile(
        id: 'civil_engineering',
        name: 'Ingeniería Civil',
        weights: {
          RiasecType.realistic: 0.95,
          RiasecType.investigative: 0.80,
          RiasecType.artistic: 0.35,
          RiasecType.social: 0.35,
          RiasecType.enterprising: 0.50,
          RiasecType.conventional: 0.70,
        },
      ),
      CareerProfile(
        id: 'business_management',
        name: 'Gestión Empresarial',
        weights: {
          RiasecType.realistic: 0.30,
          RiasecType.investigative: 0.45,
          RiasecType.artistic: 0.35,
          RiasecType.social: 0.65,
          RiasecType.enterprising: 1.00,
          RiasecType.conventional: 0.80,
        },
      ),
      CareerProfile(
        id: 'accounting',
        name: 'Contabilidad',
        weights: {
          RiasecType.realistic: 0.25,
          RiasecType.investigative: 0.50,
          RiasecType.artistic: 0.15,
          RiasecType.social: 0.35,
          RiasecType.enterprising: 0.70,
          RiasecType.conventional: 1.00,
        },
      ),
      CareerProfile(
        id: 'architecture',
        name: 'Arquitectura',
        weights: {
          RiasecType.realistic: 0.75,
          RiasecType.investigative: 0.65,
          RiasecType.artistic: 1.00,
          RiasecType.social: 0.45,
          RiasecType.enterprising: 0.50,
          RiasecType.conventional: 0.55,
        },
      ),
    ];
  }
}