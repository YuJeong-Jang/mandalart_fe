// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActionItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionItem _$ActionItemFromJson(Map<String, dynamic> json) => ActionItem(
      json['document_id'] as String,
      json['action_name'] as String,
      json['mission_doc_id'] as String,
      json['board_doc_id'] as String,
      json['cycle'] as String,
      (json['goal_unit'] as num).toInt(),
      (json['action_unit'] as num).toInt(),
      json['unit'] as String,
      (json['achievement'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActionItemToJson(ActionItem instance) =>
    <String, dynamic>{
      'document_id': instance.document_id,
      'action_name': instance.action_name,
      'mission_doc_id': instance.mission_doc_id,
      'board_doc_id': instance.board_doc_id,
      'cycle': instance.cycle,
      'goal_unit': instance.goal_unit,
      'action_unit': instance.action_unit,
      'unit': instance.unit,
      'achievement': instance.achievement,
    };
