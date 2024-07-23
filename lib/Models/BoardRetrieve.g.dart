// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardRetrieve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardRetrieve _$BoardRetrieveFromJson(Map<String, dynamic> json) =>
    BoardRetrieve(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['start_at'] as String,
      json['end_at'] as String,
      (json['achievement'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BoardRetrieveToJson(BoardRetrieve instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
      'achievement': instance.achievement,
    };
