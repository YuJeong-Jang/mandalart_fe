// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      (json['id'] as num).toInt(),
      DateTime.parse(json['created'] as String),
      DateTime.parse(json['modified'] as String),
      DateTime.parse(json['deleted'] as String),
      json['title'] as String,
      (json['achievement'] as num).toInt(),
      json['start_at'] as String,
      json['end_at'] as String,
      (json['daily_goal'] as num?)?.toInt(),
      (json['total_percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'modified': instance.modified.toIso8601String(),
      'deleted': instance.deleted.toIso8601String(),
      'title': instance.title,
      'achievement': instance.achievement,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
      'daily_goal': instance.daily_goal,
      'total_percentage': instance.total_percentage,
    };
