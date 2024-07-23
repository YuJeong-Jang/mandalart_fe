// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['board_id'] as String,
    );

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'board_id': instance.board_id,
    };
