// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    json['id'] as int,
    json['username'] as String,
    json['last_name'] as String,
    json['first_name'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.userName,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
    };
