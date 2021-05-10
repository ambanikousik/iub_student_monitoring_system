// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthGroupList _$_$AuthGroupListFromJson(Map<String, dynamic> json) {
  return _$AuthGroupList(
    (json['data'] as List<dynamic>?)
            ?.map((e) => AuthGroupData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$AuthGroupListToJson(_$AuthGroupList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$AuthGroupData _$_$AuthGroupDataFromJson(Map<String, dynamic> json) {
  return _$AuthGroupData(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$_$AuthGroupDataToJson(_$AuthGroupData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
