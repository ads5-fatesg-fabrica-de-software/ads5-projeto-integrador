enum TipoAstecaEnum {
  VISTORIA(1),
  REPORO(2);

  final int value;
  const TipoAstecaEnum(this.value);

  String get name {
    switch (this) {
      case TipoAstecaEnum.REPORO:
        return 'Reparo';
      case TipoAstecaEnum.VISTORIA:
        return 'Vistoría';
    }
  }
}
