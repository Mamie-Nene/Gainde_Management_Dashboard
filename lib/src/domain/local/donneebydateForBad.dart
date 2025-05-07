class DonneeByDateFromVolumetrieBAD{
  String dateTraitement;
  int count;

  DonneeByDateFromVolumetrieBAD( this.dateTraitement, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DonneeByDateFromVolumetrieBAD &&
              runtimeType == other.runtimeType &&
              dateTraitement == other.dateTraitement ;

  @override
  int get hashCode => dateTraitement.hashCode;
}