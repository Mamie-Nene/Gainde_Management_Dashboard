
import 'package:json_annotation/json_annotation.dart';
part 'DossierEnlevement.g.dart';

@JsonSerializable()
class DossierEnlevement{


  String dateCreation,consignataire,connaissement,numeroDossier,typeEnelevement,dateEnregistreDemande;


  DossierEnlevement(
      this.dateCreation, this.consignataire, this.connaissement,
      this.numeroDossier, this.typeEnelevement, this.dateEnregistreDemande);

  factory DossierEnlevement.fromJson(Map<String, dynamic> data)=>_$DossierEnlevementFromJson(data);
  Map<String,dynamic> toJson() => _$DossierEnlevementToJson(this);

}