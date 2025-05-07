

import 'package:json_annotation/json_annotation.dart';
part 'SortieBrigadeDataByActeur.g.dart';

@JsonSerializable()
class SortieBrigadeDataByActeur{
  final String numeroConteneur,connaissement,type,taille,gate,dateSortie,manutentionnaire,consignataire,dateDeclaration;
  final String? plomb,numeroGUSE;


  SortieBrigadeDataByActeur(
    this.numeroConteneur,
    this.type,
    this.taille,
    this.plomb,
    this.numeroGUSE,
    this.gate,
    this.dateSortie,
    this.manutentionnaire,
    this.consignataire,
      this.connaissement,
      this.dateDeclaration
      );
  factory SortieBrigadeDataByActeur.fromJson(Map<String, dynamic> data)=>_$SortieBrigadeDataByActeurFromJson(data);
  Map<String,dynamic> toJson() => _$SortieBrigadeDataByActeurToJson(this);
}