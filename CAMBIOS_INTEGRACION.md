# Cambios de integración

## Perfil y SQLite

- Se mantiene un único perfil local con `id = 1`.
- El perfil almacena nombre, edad, avatar y el resultado vocacional más reciente.
- La persistencia utiliza `sqflite`; se eliminó la dependencia directa de `shared_preferences`.
- El resultado del cuestionario actualiza automáticamente el código Holland, la dimensión dominante, la carrera recomendada y la compatibilidad.

## Pruebas

- La prueba de `ResultCalculator` se movió fuera de `lib/` hacia `test/`.
- Los datos de prueba se actualizaron para la escala oficial de AEVUM ITER: 0–10.
- Los casos inválidos ahora comprueban valores mayores que 10 y menores que 0.

## Configuración

- `flutter_test` quedó correctamente ubicado en `dev_dependencies`.
- Se retiró `shared_preferences` de `pubspec.yaml` porque el perfil ya usa SQLite.

## Verificación pendiente

Este entorno no dispone del ejecutable de Flutter. Por ello, los comandos siguientes deben ejecutarse en el equipo de desarrollo:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```
