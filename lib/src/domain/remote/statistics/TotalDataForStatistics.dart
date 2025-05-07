import 'package:json_annotation/json_annotation.dart';
part 'TotalDataForStatistics.g.dart';

@JsonSerializable()
class TotalDataForStatistics{
  //int pad, dossiers, bad,bae, Do, bonsorti,brigarde;
  int visaPad, totalDemandes, BAD,BAE, bonManutentionnaire, bonSorti,brigarde;


  TotalDataForStatistics(
      this.visaPad, this.totalDemandes, this.BAD, this.BAE, this.bonManutentionnaire,
      this.bonSorti, this.brigarde
      );
  factory TotalDataForStatistics.fromJson(Map<String, dynamic> data)=>_$TotalDataForStatisticsFromJson(data);
  Map<String,dynamic> toJson() => _$TotalDataForStatisticsToJson(this);
}
