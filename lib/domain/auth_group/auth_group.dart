import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_group.freezed.dart';
part 'auth_group.g.dart';

@freezed
abstract class AuthGroup with _$AuthGroup {
  const factory AuthGroup(@JsonKey(defaultValue: []) List<AuthGroupData> data) =
      AuthGroupList;

  const factory AuthGroup.data(int id, String name) = AuthGroupData;

  factory AuthGroup.fromJson(Map<String, dynamic> json) =>
      _$AuthGroupFromJson(json);
}
