// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthGroup _$AuthGroupFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return AuthGroupList.fromJson(json);
    case 'data':
      return AuthGroupData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$AuthGroupTearOff {
  const _$AuthGroupTearOff();

  AuthGroupList call(
      @JsonKey(defaultValue: const []) List<AuthGroupData> data) {
    return AuthGroupList(
      data,
    );
  }

  AuthGroupData data(int id, String name) {
    return AuthGroupData(
      id,
      name,
    );
  }

  AuthGroup fromJson(Map<String, Object> json) {
    return AuthGroup.fromJson(json);
  }
}

/// @nodoc
const $AuthGroup = _$AuthGroupTearOff();

/// @nodoc
mixin _$AuthGroup {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)
        $default, {
    required TResult Function(int id, String name) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)?
        $default, {
    TResult Function(int id, String name)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AuthGroupList value) $default, {
    required TResult Function(AuthGroupData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AuthGroupList value)? $default, {
    TResult Function(AuthGroupData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGroupCopyWith<$Res> {
  factory $AuthGroupCopyWith(AuthGroup value, $Res Function(AuthGroup) then) =
      _$AuthGroupCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthGroupCopyWithImpl<$Res> implements $AuthGroupCopyWith<$Res> {
  _$AuthGroupCopyWithImpl(this._value, this._then);

  final AuthGroup _value;
  // ignore: unused_field
  final $Res Function(AuthGroup) _then;
}

/// @nodoc
abstract class $AuthGroupListCopyWith<$Res> {
  factory $AuthGroupListCopyWith(
          AuthGroupList value, $Res Function(AuthGroupList) then) =
      _$AuthGroupListCopyWithImpl<$Res>;
  $Res call({@JsonKey(defaultValue: const []) List<AuthGroupData> data});
}

/// @nodoc
class _$AuthGroupListCopyWithImpl<$Res> extends _$AuthGroupCopyWithImpl<$Res>
    implements $AuthGroupListCopyWith<$Res> {
  _$AuthGroupListCopyWithImpl(
      AuthGroupList _value, $Res Function(AuthGroupList) _then)
      : super(_value, (v) => _then(v as AuthGroupList));

  @override
  AuthGroupList get _value => super._value as AuthGroupList;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(AuthGroupList(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AuthGroupData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthGroupList implements AuthGroupList {
  const _$AuthGroupList(@JsonKey(defaultValue: const []) this.data);

  factory _$AuthGroupList.fromJson(Map<String, dynamic> json) =>
      _$_$AuthGroupListFromJson(json);

  @override
  @JsonKey(defaultValue: const [])
  final List<AuthGroupData> data;

  @override
  String toString() {
    return 'AuthGroup(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthGroupList &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $AuthGroupListCopyWith<AuthGroupList> get copyWith =>
      _$AuthGroupListCopyWithImpl<AuthGroupList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)
        $default, {
    required TResult Function(int id, String name) data,
  }) {
    return $default(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)?
        $default, {
    TResult Function(int id, String name)? data,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AuthGroupList value) $default, {
    required TResult Function(AuthGroupData value) data,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AuthGroupList value)? $default, {
    TResult Function(AuthGroupData value)? data,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$AuthGroupListToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class AuthGroupList implements AuthGroup {
  const factory AuthGroupList(
          @JsonKey(defaultValue: const []) List<AuthGroupData> data) =
      _$AuthGroupList;

  factory AuthGroupList.fromJson(Map<String, dynamic> json) =
      _$AuthGroupList.fromJson;

  @JsonKey(defaultValue: const [])
  List<AuthGroupData> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthGroupListCopyWith<AuthGroupList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGroupDataCopyWith<$Res> {
  factory $AuthGroupDataCopyWith(
          AuthGroupData value, $Res Function(AuthGroupData) then) =
      _$AuthGroupDataCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$AuthGroupDataCopyWithImpl<$Res> extends _$AuthGroupCopyWithImpl<$Res>
    implements $AuthGroupDataCopyWith<$Res> {
  _$AuthGroupDataCopyWithImpl(
      AuthGroupData _value, $Res Function(AuthGroupData) _then)
      : super(_value, (v) => _then(v as AuthGroupData));

  @override
  AuthGroupData get _value => super._value as AuthGroupData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(AuthGroupData(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthGroupData implements AuthGroupData {
  const _$AuthGroupData(this.id, this.name);

  factory _$AuthGroupData.fromJson(Map<String, dynamic> json) =>
      _$_$AuthGroupDataFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'AuthGroup.data(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthGroupData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $AuthGroupDataCopyWith<AuthGroupData> get copyWith =>
      _$AuthGroupDataCopyWithImpl<AuthGroupData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)
        $default, {
    required TResult Function(int id, String name) data,
  }) {
    return data(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(defaultValue: const []) List<AuthGroupData> data)?
        $default, {
    TResult Function(int id, String name)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AuthGroupList value) $default, {
    required TResult Function(AuthGroupData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AuthGroupList value)? $default, {
    TResult Function(AuthGroupData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$AuthGroupDataToJson(this)..['runtimeType'] = 'data';
  }
}

abstract class AuthGroupData implements AuthGroup {
  const factory AuthGroupData(int id, String name) = _$AuthGroupData;

  factory AuthGroupData.fromJson(Map<String, dynamic> json) =
      _$AuthGroupData.fromJson;

  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthGroupDataCopyWith<AuthGroupData> get copyWith =>
      throw _privateConstructorUsedError;
}
