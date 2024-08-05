// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      json['document_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['token'] as String?,
      json['pwd'] as String?,
      json['pwd_mod_dt'] as int?,
      json['reg_dt'] as int?,
      json['mod_dt'] as int?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'document_id': instance.document_id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'pwd': instance.pwd,
      'pwd_mod_dt': instance.pwd_mod_dt,
      'reg_dt': instance.reg_dt,
      'mod_dt': instance.mod_dt,
    };
