enum HairStyle {
  short('Corto'),
  long('Largo'),
  curly('Rizado'),
  afro('Afro'),
  ponytail('Coleta'),
  bald('Calvo');

  const HairStyle(this.label);

  final String label;
}