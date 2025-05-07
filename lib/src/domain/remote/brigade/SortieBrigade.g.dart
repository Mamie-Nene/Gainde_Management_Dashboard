// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SortieBrigade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


SortieBrigade _$SortieBrigadeFromJson(Map<String, dynamic> json) =>

    SortieBrigade(
        json['conteneur'] as String,
        json['type'] as String,
        json['taille'] as String,
        json['plomb'] ??"Aucun",
        json['numeroGUSE']??"Aucun",
        json['porteSortie'] as String,
      //  json['dateValiditeConnaissement'] as String,
        json['dateSortieDouane'] as String,

        json['missionAgs']??false,
        json['getPass']??false,
        json['visaDouane']??false,

    );

Map<String, dynamic> _$SortieBrigadeToJson(SortieBrigade instance) =>
    <String, dynamic>{

    };
