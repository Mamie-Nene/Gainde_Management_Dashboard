import 'package:json_annotation/json_annotation.dart';
part 'VisaBrigade.g.dart';

@JsonSerializable()
class VisaBrigade{
  final String annee_decl,bureau_decl,chefBrigade,agentEnregistrement;
  final int numero_decl;
  final String regime_douanier, nom_navire,numero_voyage,provenance,ninea_decl,ninea_dest,ppm_decl,declarant,destinataire;
  final String date_decl,date_bae, date_arrivee,dateEnregistrementTime;
  final String? destination,instruction;
  final bool statusVisa;

  VisaBrigade(
      this.annee_decl,
      this.bureau_decl,
      this.chefBrigade,
      this.agentEnregistrement,
      this.numero_decl,
      this.regime_douanier,
      this.nom_navire,
      this.numero_voyage,
      this.provenance,
      this.ninea_decl,
      this.ninea_dest,
      this.ppm_decl,
      this.declarant,
      this.destinataire,
      this.date_decl,
      this.date_bae,
      this.date_arrivee,
    //  this.apurement,
      //this.dateEnregistrement,
      this.dateEnregistrementTime,
      this.destination,
      this.instruction,
      this.statusVisa
      );
  factory VisaBrigade.fromJson(Map<String, dynamic> data)=>_$VisaBrigadeFromJson(data);
  Map<String,dynamic> toJson() => _$VisaBrigadeToJson(this);
}