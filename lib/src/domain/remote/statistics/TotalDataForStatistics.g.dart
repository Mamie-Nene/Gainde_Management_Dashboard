// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TotalDataForStatistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalDataForStatistics _$TotalDataForStatisticsFromJson(Map<String, dynamic> json) =>

    TotalDataForStatistics(
        json['visaPad'] as int,
        json['totalDemandes'] as int,
        json['BAD'] as int,
        json['BAE'] as int,
        json['bonManutentionnaire'] as int,
       // json['do'] as int,
        json['bonSorti'] as int,
        json['brigarde'] as int
    );

Map<String, dynamic> _$TotalDataForStatisticsToJson(TotalDataForStatistics instance) =>
    <String, dynamic>{
      'visaPad': instance.visaPad,
      'totalDemandes': instance.totalDemandes,
      'BAD': instance.BAD,
      'BAE': instance.BAE,
      'bonManutentionnaire': instance.bonManutentionnaire,
      //'do': instance.Do,
      'bonSorti': instance.bonSorti,
      'brigarde': instance.brigarde,
    };
