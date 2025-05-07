class DonneeFromSortieBrigadeByConsignataire{
  String consignataire;
  int count;

  DonneeFromSortieBrigadeByConsignataire( this.consignataire, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonneeFromSortieBrigadeByConsignataire &&
          runtimeType == other.runtimeType &&
          consignataire == other.consignataire ;

  @override
  int get hashCode => consignataire.hashCode;
}