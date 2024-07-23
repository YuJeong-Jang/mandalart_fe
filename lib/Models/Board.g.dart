// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      (json['id'] as num).toInt(),
      json['created'] as String,
      json['modified'] as String,
      json['deleted'] as String?,
      json['title'] as String,
      (json['achievement'] as num?)?.toInt(),
      json['start_at'] as String,
      json['end_at'] as String,
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'modified': instance.modified,
      'deleted': instance.deleted,
      'title': instance.title,
      'achievement': instance.achievement,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
    };
