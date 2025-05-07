class DonneeByDateFromSortieBrigadeByType{
  String libelle;
  int count;

  DonneeByDateFromSortieBrigadeByType( this.libelle, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DonneeByDateFromSortieBrigadeByType &&
              runtimeType == other.runtimeType &&
              libelle == other.libelle ;

  DonneeByDateFromSortieBrigadeByType _$DonneeByDateFromSortieBrigadeByTypeFromJson(Map<String, int> json) =>

      DonneeByDateFromSortieBrigadeByType(
          json['libelle'] as String,
          json['count'] as int,
      );
  @override
  int get hashCode => libelle.hashCode;
}