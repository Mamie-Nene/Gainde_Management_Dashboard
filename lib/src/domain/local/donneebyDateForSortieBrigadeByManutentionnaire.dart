class DonneeFromSortieBrigadeByManutentionnaire{
  String manutentionnaire;
  int count;

  DonneeFromSortieBrigadeByManutentionnaire( this.manutentionnaire, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonneeFromSortieBrigadeByManutentionnaire &&
          runtimeType == other.runtimeType &&
          manutentionnaire == other.manutentionnaire ;

  @override
  int get hashCode => manutentionnaire.hashCode;
}