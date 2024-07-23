// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      (json['pk'] as num).toInt(),
      json['username'] as String,
      json['email'] as String,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['token'] as String?,
      json['password1'] as String?,
      json['password2'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'pk': instance.pk,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'token': instance.token,
      'password1': instance.password1,
      'password2': instance.password2,
    };
