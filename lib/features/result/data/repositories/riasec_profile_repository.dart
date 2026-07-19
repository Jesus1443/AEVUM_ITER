import '../../../test/domain/enums/riasec_dimension.dart';
import '../../domain/entities/riasec_profile.dart';

class RiasecProfileRepository {
  const RiasecProfileRepository();

  List<RiasecProfile> getProfiles() {
    return const [
      RiasecProfile(
        type: RiasecDimension.realistic,
        name: 'Realista',
        shortDescription: 'Práctico, técnico y orientado a la acción.',
        description:
            'El perfil Realista se relaciona con actividades prácticas, '
            'técnicas y manuales. Las personas con una puntuación alta en '
            'esta dimensión suelen disfrutar construir, reparar, operar '
            'herramientas, trabajar con maquinaria o resolver problemas '
            'mediante acciones concretas.',
        strengths: [
          'Resolución práctica de problemas',
          'Habilidad técnica y manual',
          'Pensamiento concreto',
          'Uso de herramientas y equipos',
        ],
        interests: [
          'Tecnología',
          'Construcción',
          'Maquinaria',
          'Procesos técnicos',
        ],
        workEnvironments: [
          'Talleres',
          'Laboratorios técnicos',
          'Obras',
          'Plantas industriales',
        ],
      ),
      RiasecProfile(
        type: RiasecDimension.investigative,
        name: 'Investigador',
        shortDescription: 'Analítico, curioso y orientado al conocimiento.',
        description:
            'El perfil Investigador se caracteriza por el interés en '
            'analizar, comprender y resolver problemas complejos. Las '
            'personas con una puntuación alta suelen disfrutar investigar, '
            'experimentar, aprender y trabajar con información, datos, '
            'modelos y conceptos abstractos.',
        strengths: [
          'Pensamiento lógico',
          'Análisis de información',
          'Resolución de problemas complejos',
          'Aprendizaje autónomo',
        ],
        interests: [
          'Ciencia',
          'Programación',
          'Matemáticas',
          'Investigación',
        ],
        workEnvironments: [
          'Laboratorios',
          'Centros de investigación',
          'Áreas de desarrollo tecnológico',
          'Entornos académicos',
        ],
      ),
      RiasecProfile(
        type: RiasecDimension.artistic,
        name: 'Artístico',
        shortDescription: 'Creativo, expresivo y orientado a la innovación.',
        description:
            'El perfil Artístico se relaciona con la creatividad, la '
            'expresión y la generación de ideas originales. Las personas '
            'con una puntuación alta suelen preferir actividades flexibles '
            'que les permitan diseñar, imaginar, crear y comunicar.',
        strengths: [
          'Creatividad',
          'Pensamiento visual',
          'Innovación',
          'Expresión de ideas',
        ],
        interests: [
          'Diseño',
          'Arquitectura',
          'Comunicación visual',
          'Creación de proyectos',
        ],
        workEnvironments: [
          'Estudios de diseño',
          'Despachos creativos',
          'Entornos culturales',
          'Espacios de innovación',
        ],
      ),
      RiasecProfile(
        type: RiasecDimension.social,
        name: 'Social',
        shortDescription: 'Colaborativo, empático y orientado a las personas.',
        description:
            'El perfil Social se caracteriza por el interés en ayudar, '
            'orientar, enseñar y colaborar con otras personas. Quienes '
            'obtienen una puntuación alta suelen sentirse cómodos '
            'comunicándose, trabajando en equipo y contribuyendo al '
            'desarrollo de los demás.',
        strengths: [
          'Comunicación interpersonal',
          'Empatía',
          'Trabajo en equipo',
          'Orientación y acompañamiento',
        ],
        interests: [
          'Enseñanza',
          'Servicio',
          'Trabajo comunitario',
          'Desarrollo humano',
        ],
        workEnvironments: [
          'Instituciones educativas',
          'Organizaciones sociales',
          'Equipos multidisciplinarios',
          'Áreas de atención y servicio',
        ],
      ),
      RiasecProfile(
        type: RiasecDimension.enterprising,
        name: 'Emprendedor',
        shortDescription: 'Persuasivo, dinámico y orientado al liderazgo.',
        description:
            'El perfil Emprendedor se relaciona con la iniciativa, el '
            'liderazgo y la capacidad de influir en otras personas. Las '
            'personas con una puntuación alta suelen disfrutar tomar '
            'decisiones, coordinar proyectos, negociar y alcanzar objetivos.',
        strengths: [
          'Liderazgo',
          'Toma de decisiones',
          'Persuasión',
          'Iniciativa',
        ],
        interests: [
          'Negocios',
          'Administración',
          'Emprendimiento',
          'Dirección de proyectos',
        ],
        workEnvironments: [
          'Empresas',
          'Organizaciones comerciales',
          'Áreas administrativas',
          'Proyectos de emprendimiento',
        ],
      ),
      RiasecProfile(
        type: RiasecDimension.conventional,
        name: 'Convencional',
        shortDescription: 'Organizado, preciso y orientado a los procesos.',
        description:
            'El perfil Convencional se caracteriza por el interés en el '
            'orden, la estructura y la administración de información. Las '
            'personas con una puntuación alta suelen desenvolverse bien en '
            'actividades que requieren precisión, planificación, control y '
            'seguimiento de procedimientos.',
        strengths: [
          'Organización',
          'Atención al detalle',
          'Planeación',
          'Manejo de información',
        ],
        interests: [
          'Administración',
          'Finanzas',
          'Control de datos',
          'Procesos organizacionales',
        ],
        workEnvironments: [
          'Oficinas',
          'Áreas contables',
          'Departamentos administrativos',
          'Entornos estructurados',
        ],
      ),
    ];
  }

  RiasecProfile getProfile(RiasecDimension type) {
    return getProfiles().firstWhere(
      (profile) => profile.type == type,
    );
  }
}