// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
    json['document_id'] as String,
    json['mission_name'] as String,
    json['board_id'] as String,
    json['reg_dt'] as int?,
    json['mod_dt'] as int?,
    json['del_dt'] as int?,
    json['del_yn'] as bool?,
    json['actions'] as ActionItem);

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'document_id': instance.document_id,
      'mission_name': instance.mission_name,
      'board_id': instance.board_id,
      'reg_dt': instance.reg_dt,
      'mod_dt': instance.mod_dt,
      'del_dt': instance.del_dt,
      'del_yn': instance.del_yn,
      'actions': instance.actions
    };
