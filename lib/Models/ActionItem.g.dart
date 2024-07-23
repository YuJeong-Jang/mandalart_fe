// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActionItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionItem _$ActionItemFromJson(Map<String, dynamic> json) => ActionItem(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['mission_id'] as num).toInt(),
      json['cycle'] as String,
      (json['goal_unit'] as num).toInt(),
      (json['action_unit'] as num).toInt(),
      json['unit_name'] as String,
      (json['achievement'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActionItemToJson(ActionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mission_id': instance.mission_id,
      'cycle': instance.cycle,
      'goal_unit': instance.goal_unit,
      'action_unit': instance.action_unit,
      'unit_name': instance.unit_name,
      'achievement': instance.achievement,
    };
