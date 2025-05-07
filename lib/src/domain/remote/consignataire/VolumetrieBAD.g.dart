// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VolumetrieBAD.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumetrieBAD _$VolumetrieBADFromJson(Map<String, dynamic> json) =>

    VolumetrieBAD(
        json['connaissement'] as String ,
        json['numeroDossier'] as String ,
        json['codeAction'] as String ,
        json['codeActeur'] as String ,
        json['libelleActeur'] as String ,
        json['libelleAction'] as String ,
        json['localDateTimeAction'] as String ,
        json['localDateAction']??"AUCUN" ,
        json['updated'] as bool ,

    );

Map<String, dynamic> _$VolumetrieBADToJson(VolumetrieBAD instance) =>
    <String, dynamic>{
      'connaissement': instance.connaissement,
      'numeroDossier': instance.numeroDossier,
      'codeAction': instance.codeAction,
      'codeActeur': instance.codeActeur,
      'libelleActeur': instance.libelleActeur,
      'libelleAction': instance.libelleAction,
      'localDateTimeAction': instance.localDateTimeAction,
      'updated': instance.updated,
    };
