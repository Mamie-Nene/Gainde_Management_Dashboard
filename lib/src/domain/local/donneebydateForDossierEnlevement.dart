class DonneeByDateFromVolumetrieDossierEnlevement{
  String dateCreation;
  int count;

  DonneeByDateFromVolumetrieDossierEnlevement( this.dateCreation, this.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DonneeByDateFromVolumetrieDossierEnlevement &&
              runtimeType == other.runtimeType &&
              dateCreation == other.dateCreation ;

  @override
  int get hashCode => dateCreation.hashCode;
}