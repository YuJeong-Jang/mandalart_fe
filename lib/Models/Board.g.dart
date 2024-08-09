// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      json['document_id'] as String,
      (json['reg_dt'] as num).toInt(),
      (json['mod_dt'] as num).toInt(),
      (json['del_dt'] as num).toInt(),
      json['del_yn'] as bool,
      json['boardNm'] as String,
      json['start_at'] as String,
      json['end_at'] as String,
      (json['daily_goal'] as num?)?.toInt(),
      (json['total_percentage'] as num?)?.toDouble(),
      json['missions'] as Mission
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'document_id': instance.document_id,
      'reg_dt': instance.reg_dt,
      'mod_dt': instance.mod_dt,
      'del_dt': instance.del_dt,
      'del_yn': instance.del_yn,
      'boardNm': instance.boardNm,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
      'daily_goal': instance.daily_goal,
      'total_percentage': instance.total_percentage,
      'missions': instance.missions
    };
