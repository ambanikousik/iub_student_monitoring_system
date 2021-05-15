import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
    int id,
    @JsonKey(name: 'username') String userName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'first_name') String firstName,
  ) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
