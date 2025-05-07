import 'package:json_annotation/json_annotation.dart';
part 'VolumetrieBAD.g.dart';

@JsonSerializable()
class VolumetrieBAD{
  String connaissement,numeroDossier,codeAction ,codeActeur , libelleActeur , libelleAction ;
 String localDateTimeAction;
  String localDateAction;
  bool updated;


  VolumetrieBAD(
      this.connaissement,
      this.numeroDossier,
      this.codeAction,
      this.codeActeur,
      this.libelleActeur,
      this.libelleAction,
      this.localDateTimeAction,
      this.localDateAction,
      this.updated);


  factory VolumetrieBAD.fromJson(Map<String, dynamic> data)=>_$VolumetrieBADFromJson(data);
  Map<String,dynamic> toJson() => _$VolumetrieBADToJson(this);
}