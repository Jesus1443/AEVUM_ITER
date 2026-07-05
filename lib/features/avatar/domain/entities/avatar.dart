import '../enums/eye_style.dart';
import '../enums/hair_color.dart';
import '../enums/hair_style.dart';
import '../enums/outfit.dart';
import '../enums/skin_color.dart';

class Avatar {
  const Avatar({
    required this.id,
    required this.name,
    required this.baseAvatarImage,
    this.skinColor = SkinColor.medium,
    this.hairStyle = HairStyle.short,
    this.hairColor = HairColor.black,
    this.eyeStyle = EyeStyle.normal,
    this.outfit = Outfit.casual,
  });

  final String id;
  final String name;
  final String baseAvatarImage;

  final SkinColor skinColor;
  final HairStyle hairStyle;
  final HairColor hairColor;
  final EyeStyle eyeStyle;
  final Outfit outfit;

  Avatar copyWith({
    String? id,
    String? name,
    String? baseAvatarImage,
    SkinColor? skinColor,
    HairStyle? hairStyle,
    HairColor? hairColor,
    EyeStyle? eyeStyle,
    Outfit? outfit,
  }) {
    return Avatar(
      id: id ?? this.id,
      name: name ?? this.name,
      baseAvatarImage: baseAvatarImage ?? this.baseAvatarImage,
      skinColor: skinColor ?? this.skinColor,
      hairStyle: hairStyle ?? this.hairStyle,
      hairColor: hairColor ?? this.hairColor,
      eyeStyle: eyeStyle ?? this.eyeStyle,
      outfit: outfit ?? this.outfit,
    );
  }

  @override
  String toString() {
    return '''
Avatar(
  id: $id,
  name: $name,
  baseAvatarImage: $baseAvatarImage,
  skinColor: $skinColor,
  hairStyle: $hairStyle,
  hairColor: $hairColor,
  eyeStyle: $eyeStyle,
  outfit: $outfit,
)
''';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Avatar &&
            id == other.id &&
            name == other.name &&
            baseAvatarImage == other.baseAvatarImage &&
            skinColor == other.skinColor &&
            hairStyle == other.hairStyle &&
            hairColor == other.hairColor &&
            eyeStyle == other.eyeStyle &&
            outfit == other.outfit;
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        baseAvatarImage,
        skinColor,
        hairStyle,
        hairColor,
        eyeStyle,
        outfit,
      );
}