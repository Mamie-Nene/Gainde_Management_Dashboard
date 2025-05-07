// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SortieBrigadeDataByActeur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


SortieBrigadeDataByActeur _$SortieBrigadeDataByActeurFromJson(Map<String, dynamic> json) =>


    SortieBrigadeDataByActeur(
        json['numeroConteneur'] as String,
        json['type'] as String,
        json['taille'] as String,
        json['plomb'] ??"Aucun",
        json['numeroGUSE']??"Aucun",
        json['gate'] as String,
        json['dateSortie'] as String ,
        json['manutentionnaire'] as String,
        json['consignataire'] as String,
        json['connaissement'] as String,
        json['dateDeclaration']?? "AUCUN"

    );

Map< String, dynamic> _$SortieBrigadeDataByActeurToJson(SortieBrigadeDataByActeur instance) =>
    <String, dynamic>{

    };
