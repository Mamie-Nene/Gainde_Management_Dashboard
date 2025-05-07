class DonneeByDateFromVisaBrigade{
  String dateTraitement;
  int count;

  DonneeByDateFromVisaBrigade( this.dateTraitement, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DonneeByDateFromVisaBrigade &&
              runtimeType == other.runtimeType &&
              dateTraitement == other.dateTraitement ;

  @override
  int get hashCode => dateTraitement.hashCode;
}