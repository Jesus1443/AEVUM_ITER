import '../../domain/entities/career_profile.dart';
import '../../../test/domain/enums/career.dart';
import '../../../test/domain/enums/riasec_dimension.dart';

class CareerRepository {
  const CareerRepository();

  List<CareerProfile> getCareers() => List.unmodifiable(_careers);

  CareerProfile getByCareer(Career career) {
    return _careers.firstWhere(
      (profile) => profile.career == career,
    );
  }
}

const List<CareerProfile> _careers = [

  CareerProfile(
    career: Career.civil,
    name: 'Ingeniería Civil',
    description:
        'Profesionales dedicados al diseño, construcción y mantenimiento de obras de infraestructura.',
    dimensions: [
      RiasecDimension.realistic,
    ],
  ),

  CareerProfile(
    career: Career.electromechanical,
    name: 'Ingeniería Electromecánica',
    description:
        'Diseño, operación y mantenimiento de sistemas mecánicos, eléctricos e industriales.',
    dimensions: [
      RiasecDimension.realistic,
    ],
  ),

  CareerProfile(
    career: Career.electronics,
    name: 'Ingeniería Electrónica',
    description:
        'Desarrollo de sistemas electrónicos, automatización, control y telecomunicaciones.',
    dimensions: [
      RiasecDimension.realistic,
    ],
  ),

  CareerProfile(
    career: Career.biochemistry,
    name: 'Ingeniería Bioquímica',
    description:
        'Aplicación de procesos químicos y biológicos para resolver problemas industriales y ambientales.',
    dimensions: [
      RiasecDimension.investigative,
    ],
  ),

  CareerProfile(
    career: Career.computerSystems,
    name: 'Ingeniería en Sistemas Computacionales',
    description:
        'Desarrollo de software, bases de datos, redes, inteligencia artificial y ciberseguridad.',
    dimensions: [
      RiasecDimension.investigative,
    ],
  ),

  CareerProfile(
    career: Career.informatics,
    name: 'Ingeniería Informática',
    description:
        'Diseño e implementación de soluciones informáticas para organizaciones.',
    dimensions: [
      RiasecDimension.investigative,
    ],
  ),

  CareerProfile(
    career: Career.architecture,
    name: 'Arquitectura',
    description:
        'Diseño de espacios funcionales y estéticos para mejorar el entorno construido.',
    dimensions: [
      RiasecDimension.realistic,
      RiasecDimension.artistic,
    ],
  ),

  CareerProfile(
    career: Career.applicationDevelopment,
    name: 'Desarrollo de Aplicaciones (UI/UX)',
    description:
        'Diseño de interfaces y experiencias de usuario para aplicaciones digitales.',
    dimensions: [
      RiasecDimension.artistic,
    ],
  ),

  CareerProfile(
    career: Career.businessAdministration,
    name: 'Licenciatura en Administración',
    description:
        'Planeación, organización y dirección de empresas y organizaciones.',
    dimensions: [
      RiasecDimension.social,
      RiasecDimension.enterprising,
      RiasecDimension.conventional,
    ],
  ),

  CareerProfile(
    career: Career.businessManagement,
    name: 'Ingeniería en Gestión Empresarial',
    description:
        'Gestión de proyectos, innovación, procesos y desarrollo organizacional.',
    dimensions: [
      RiasecDimension.social,
      RiasecDimension.enterprising,
    ],
  ),

  CareerProfile(
    career: Career.accounting,
    name: 'Licenciatura en Contaduría',
    description:
        'Administración de recursos financieros, auditoría e información contable.',
    dimensions: [
      RiasecDimension.conventional,
    ],
  ),
];