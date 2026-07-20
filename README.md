# AEVUM ITER

Aplicación móvil de orientación vocacional desarrollada con Flutter. Utiliza el modelo RIASEC de Holland para analizar las respuestas del usuario y recomendar las carreras del Tecnológico con mayor compatibilidad.

## Funcionalidades principales

- Onboarding y creación de un perfil local.
- Selección de avatar, nombre y edad.
- Cuestionario vocacional con escala de respuesta de 0 a 10.
- Cálculo de las seis dimensiones RIASEC.
- Generación del código Holland a partir de las tres dimensiones dominantes.
- Ranking de carreras por porcentaje de compatibilidad.
- Perfil local con el último resultado vocacional.
- Persistencia mediante SQLite, sin autenticación ni conexión a internet.

## Arquitectura

El código está organizado por funcionalidades y separado en capas cuando el módulo lo requiere:

```text
lib/
├── app/
│   ├── routes/
│   └── theme/
├── core/
│   ├── constants/
│   ├── database/
│   └── widgets/
└── features/
    ├── avatar/
    ├── onboarding/
    ├── path/
    ├── profile/
    ├── result/
    ├── splash/
    └── test/
```

### Capas del módulo Profile

```text
features/profile/
├── data/
│   ├── local/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   └── repositories/
└── presentation/
    ├── pages/
    ├── providers/
    └── widgets/
```

- **domain** define la entidad `UserProfile` y el contrato del repositorio.
- **data** transforma registros de SQLite y ejecuta las operaciones de persistencia.
- **presentation** muestra el perfil y mantiene la interfaz sincronizada mediante Riverpod.

## Persistencia local

La base de datos se administra desde:

```text
lib/core/database/app_database.dart
```

AEVUM ITER maneja un solo perfil local, almacenado en la tabla `user_profile` con el identificador fijo `1`.

Campos actuales:

- nombre;
- edad;
- avatar;
- código Holland;
- dimensión dominante;
- carrera recomendada;
- compatibilidad.

La aplicación conserva únicamente el resultado más reciente. No existe historial ni autenticación.

## Flujo principal

```text
Splash
  ├── Sin perfil → Onboarding → Avatar → Datos personales → Test
  └── Con perfil → Recorrido

Test → Resultado → Actualización automática del perfil

Recorrido → Perfil → Editar perfil
```

## Cálculo RIASEC

Cada respuesta utiliza una escala de `0` a `10`.

- `0` representa ausencia de afinidad.
- `10` representa afinidad máxima.

El resultado de cada dimensión se normaliza a un porcentaje entre `0` y `100`. El código Holland se forma con las iniciales de las tres dimensiones con mayor puntuación:

- R: Realista
- I: Investigador
- A: Artístico
- S: Social
- E: Emprendedor
- C: Convencional

La compatibilidad de una carrera es el promedio de las dimensiones asociadas a su perfil.

## Dependencias principales

- `flutter_riverpod`: gestión de estado.
- `go_router`: navegación declarativa.
- `sqflite`: base de datos SQLite.
- `path`: construcción segura de la ruta de la base de datos.

## Ejecución

Requisitos:

- Flutter compatible con Dart `^3.11.0`.
- Android Studio o Visual Studio Code con las extensiones de Flutter y Dart.
- Un emulador o dispositivo Android configurado.

Comandos:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Pruebas

Las pruebas se encuentran en:

```text
test/features/result/result_calculator_test.dart
```

Validan:

- normalización de puntuaciones;
- generación del código Holland;
- orden del ranking RIASEC;
- orden de compatibilidad de carreras;
- validación de respuestas fuera del rango 0–10.

## Ampliaciones futuras

La estructura permite añadir posteriormente:

- historial de resultados;
- carreras favoritas;
- estadísticas;
- preferencias de interfaz;
- migraciones de base de datos.
