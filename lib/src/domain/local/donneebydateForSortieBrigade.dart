class DonneeByDateFromSortieBrigade{
  String dateTraitement;
  int count;

  DonneeByDateFromSortieBrigade( this.dateTraitement, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DonneeByDateFromSortieBrigade &&
              runtimeType == other.runtimeType &&
              dateTraitement == other.dateTraitement ;

  @override
  int get hashCode => dateTraitement.hashCode;
}