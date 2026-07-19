import '../../domain/entities/test_question.dart';
import '../../domain/enums/career.dart';
import '../../domain/enums/riasec_dimension.dart';

class TestRepository {
  const TestRepository();

  List<TestQuestion> getQuestions() => List.unmodifiable(_questions);

  TestQuestion? getQuestionById(int id) {
    for (final question in _questions) {
      if (question.id == id) {
        return question;
      }
    }

    return null;
  }

  int get totalQuestions => _questions.length;
}

const List<TestQuestion> _questions = [
  // ============================================================
  // R: REALISTA
  // ============================================================

  TestQuestion(
    id: 1,
    text:
        '¿Te gustaría aprender a interpretar planos de construcción y estructuras arquitectónicas?',
    dimension: RiasecDimension.realistic,
    careers: [
      Career.civil,
      Career.electromechanical,
      Career.electronics,
      Career.architecture,
    ],
  ),
  TestQuestion(
    id: 2,
    text:
        '¿Disfrutas trabajar con herramientas para reparar circuitos electrónicos o motores?',
    dimension: RiasecDimension.realistic,
    careers: [
      Career.civil,
      Career.electromechanical,
      Career.electronics,
      Career.architecture,
    ],
  ),
  TestQuestion(
    id: 3,
    text:
        '¿Te interesa conocer la resistencia de materiales como el concreto, acero o polímeros?',
    dimension: RiasecDimension.realistic,
    careers: [
      Career.civil,
      Career.electromechanical,
      Career.electronics,
      Career.architecture,
    ],
  ),
  TestQuestion(
    id: 4,
    text:
        '¿Prefieres las actividades prácticas que requieren esfuerzo físico o trabajo en exteriores?',
    dimension: RiasecDimension.realistic,
    careers: [
      Career.civil,
      Career.electromechanical,
      Career.electronics,
      Career.architecture,
    ],
  ),
  TestQuestion(
    id: 5,
    text:
        '¿Te llama la atención el funcionamiento de sistemas de energía y automatización industrial?',
    dimension: RiasecDimension.realistic,
    careers: [
      Career.civil,
      Career.electromechanical,
      Career.electronics,
      Career.architecture,
    ],
  ),

  // ============================================================
  // I: INVESTIGADOR
  // ============================================================

  TestQuestion(
    id: 6,
    text:
        '¿Te apasiona encontrar la solución a problemas lógicos o algoritmos complejos?',
    dimension: RiasecDimension.investigative,
    careers: [
      Career.biochemistry,
      Career.computerSystems,
      Career.informatics,
    ],
  ),
  TestQuestion(
    id: 7,
    text:
        '¿Te da curiosidad investigar cómo los procesos químicos transforman los alimentos o medicinas?',
    dimension: RiasecDimension.investigative,
    careers: [
      Career.biochemistry,
      Career.computerSystems,
      Career.informatics,
    ],
  ),
  TestQuestion(
    id: 8,
    text:
        '¿Te gusta analizar datos y estadísticas para entender cómo funciona un sistema?',
    dimension: RiasecDimension.investigative,
    careers: [
      Career.biochemistry,
      Career.computerSystems,
      Career.informatics,
    ],
  ),
  TestQuestion(
    id: 9,
    text:
        '¿Te interesa el mundo de la ciberseguridad, las redes y la protección de datos?',
    dimension: RiasecDimension.investigative,
    careers: [
      Career.biochemistry,
      Career.computerSystems,
      Career.informatics,
    ],
  ),
  TestQuestion(
    id: 10,
    text:
        '¿Disfrutas de la lectura técnica sobre ciencia aplicada y nuevos descubrimientos?',
    dimension: RiasecDimension.investigative,
    careers: [
      Career.biochemistry,
      Career.computerSystems,
      Career.informatics,
    ],
  ),

  // ============================================================
  // A: ARTÍSTICO
  // ============================================================

  TestQuestion(
    id: 11,
    text:
        '¿Dedicas tiempo a cuidar la estética y el diseño visual de tus trabajos o redes sociales?',
    dimension: RiasecDimension.artistic,
    careers: [
      Career.architecture,
      Career.applicationDevelopment,
    ],
  ),
  TestQuestion(
    id: 12,
    text:
        '¿Te gustaría diseñar espacios habitables que sean tanto funcionales como bellos?',
    dimension: RiasecDimension.artistic,
    careers: [
      Career.architecture,
      Career.applicationDevelopment,
    ],
  ),
  TestQuestion(
    id: 13,
    text:
        '¿Te interesa el diseño de interfaces digitales para que una app sea fácil de usar?',
    dimension: RiasecDimension.artistic,
    careers: [
      Career.architecture,
      Career.applicationDevelopment,
    ],
  ),
  TestQuestion(
    id: 14,
    text:
        '¿Prefieres crear algo nuevo desde cero en lugar de seguir un manual ya escrito?',
    dimension: RiasecDimension.artistic,
    careers: [
      Career.architecture,
      Career.applicationDevelopment,
    ],
  ),
  TestQuestion(
    id: 15,
    text:
        '¿Te gusta dibujar, modelar en 3D o realizar composiciones visuales creativas?',
    dimension: RiasecDimension.artistic,
    careers: [
      Career.architecture,
      Career.applicationDevelopment,
    ],
  ),

  // ============================================================
  // S: SOCIAL
  // ============================================================

  TestQuestion(
    id: 16,
    text:
        '¿Te sientes cómodo liderando grupos de personas para alcanzar un objetivo común?',
    dimension: RiasecDimension.social,
    careers: [
      Career.businessAdministration,
      Career.businessManagement,
    ],
  ),
  TestQuestion(
    id: 17,
    text:
        '¿Te motiva pensar en cómo tus proyectos pueden ayudar al desarrollo de Tuxtepec?',
    dimension: RiasecDimension.social,
    careers: [
      Career.businessAdministration,
      Career.businessManagement,
    ],
  ),
  TestQuestion(
    id: 18,
    text:
        '¿Disfrutas de asesorar o enseñar a otros sobre temas que tú dominas?',
    dimension: RiasecDimension.social,
    careers: [
      Career.businessAdministration,
      Career.businessManagement,
    ],
  ),
  TestQuestion(
    id: 19,
    text:
        '¿Consideras que tienes facilidad de palabra para exponer ideas ante un público?',
    dimension: RiasecDimension.social,
    careers: [
      Career.businessAdministration,
      Career.businessManagement,
    ],
  ),
  TestQuestion(
    id: 20,
    text:
        '¿Te interesa el bienestar de los trabajadores y el clima laboral dentro de una empresa?',
    dimension: RiasecDimension.social,
    careers: [
      Career.businessAdministration,
      Career.businessManagement,
    ],
  ),

  // ============================================================
  // E: EMPRENDEDOR
  // ============================================================

  TestQuestion(
    id: 21,
    text:
        '¿Te gustaría diseñar un plan de negocios para lanzar tu propia "Startup" o empresa?',
    dimension: RiasecDimension.enterprising,
    careers: [
      Career.businessManagement,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 22,
    text:
        '¿Te consideras una persona competitiva que busca optimizar recursos para ganar más?',
    dimension: RiasecDimension.enterprising,
    careers: [
      Career.businessManagement,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 23,
    text:
        '¿Te interesa la logística, es decir, cómo llevar un producto desde la fábrica al cliente?',
    dimension: RiasecDimension.enterprising,
    careers: [
      Career.businessManagement,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 24,
    text:
        '¿Disfrutas de las ventas, la negociación y el trato con proveedores o clientes?',
    dimension: RiasecDimension.enterprising,
    careers: [
      Career.businessManagement,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 25,
    text:
        '¿Te sientes capaz de tomar decisiones financieras importantes bajo presión?',
    dimension: RiasecDimension.enterprising,
    careers: [
      Career.businessManagement,
      Career.businessAdministration,
    ],
  ),

  // ============================================================
  // C: CONVENCIONAL
  // ============================================================

  TestQuestion(
    id: 26,
    text:
        '¿Te gusta llevar un control estricto de ingresos, egresos y presupuestos personales?',
    dimension: RiasecDimension.conventional,
    careers: [
      Career.accounting,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 27,
    text:
        '¿Eres muy minucioso al revisar que los documentos no tengan errores de cálculo?',
    dimension: RiasecDimension.conventional,
    careers: [
      Career.accounting,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 28,
    text:
        '¿Te interesa el mundo de los impuestos, las auditorías y las leyes financieras?',
    dimension: RiasecDimension.conventional,
    careers: [
      Career.accounting,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 29,
    text:
        '¿Prefieres trabajar en entornos organizados donde existan procesos y reglas claras?',
    dimension: RiasecDimension.conventional,
    careers: [
      Career.accounting,
      Career.businessAdministration,
    ],
  ),
  TestQuestion(
    id: 30,
    text:
        '¿Disfrutas organizando grandes cantidades de información en tablas o bases de datos?',
    dimension: RiasecDimension.conventional,
    careers: [
      Career.accounting,
      Career.businessAdministration,
    ],
  ),
];