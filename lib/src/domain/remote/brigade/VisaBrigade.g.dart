// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VisaBrigade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


VisaBrigade _$VisaBrigadeFromJson(Map<String, dynamic> json) =>

    VisaBrigade(
      json['annee_decl'] as String,
      json['bureau_decl'] as String,
      json['chefBrigade'] as String,
      json['agentEnregistrement'] as String,
      json['numero_decl'] as int,
      json['regime_douanier'] as String,
      json['nom_navire'] as String,
      json['numero_voyage']??"N/A" as String,
      json['provenance'] as String,
      json['ninea_decl'] as String,
      json['ninea_dest'] as String,
      json['ppm_decl'] as String,
      json['declarant'] as String,
      json['destinataire'] as String,
      json['date_decl'] as String,
      json['date_bae'] as String,
      json['date_arrivee']??"N/A" as String,
     // json['apurement'] as String,
     // json['dateEnregistrement'] as String,
      json['dateEnregistrementTime'] as String,
      json['destination']??"N/A",
      json['instruction']??"N/A",
      json['statusVisa']as bool

    );

Map<String, dynamic> _$VisaBrigadeToJson(VisaBrigade instance) =>
    <String, dynamic>{
      'annee_decl': instance.annee_decl,
      'bureau_decl': instance.bureau_decl,
      'chefBrigade': instance.chefBrigade,
      'agentEnregistrement': instance.agentEnregistrement,
      'numero_decl': instance.numero_decl,
      'regime_douanier': instance.regime_douanier,
      'nom_navire': instance.nom_navire,
      'numero_voyage': instance.numero_voyage,
      'provenance': instance.provenance,
      'ninea_decl': instance.ninea_decl,
      'ninea_dest': instance.ninea_dest,
      'ppm_decl': instance.ppm_decl,
      'declarant': instance.declarant,
      'destinataire': instance.destinataire,
      'date_decl': instance.date_decl,
      'date_bae': instance.date_bae,
      'date_arrivee': instance.date_arrivee,
     // 'apurement': instance.apurement,
     // 'dateEnregistrement': instance.dateEnregistrement,
      'dateEnregistrementTime': instance.dateEnregistrementTime,
      'destination': instance.destination,
      'instruction': instance.instruction,
      'statusVisa': instance.statusVisa,

    };
