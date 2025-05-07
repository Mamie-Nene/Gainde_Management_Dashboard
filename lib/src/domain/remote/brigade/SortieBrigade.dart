import 'package:json_annotation/json_annotation.dart';
part 'SortieBrigade.g.dart';

@JsonSerializable()
class SortieBrigade{
  final String conteneur,type,taille,porteSortie,dateSortieDouane;
  final String? plomb,numeroGUSE;
  final bool missionAgs ,getPass , visaDouane;

  SortieBrigade(
      this.conteneur,
      this.type,
      this.taille,
      this.plomb,
      this.numeroGUSE,
      this.porteSortie,
     // this.dateEnregistrement,
     // this.dateValiditeConnaissement,
      this.dateSortieDouane,
      this.missionAgs,
      this.getPass,
      this.visaDouane,
      );
  factory SortieBrigade.fromJson(Map<String, dynamic> data)=>_$SortieBrigadeFromJson(data);
  Map<String,dynamic> toJson() => _$SortieBrigadeToJson(this);
}