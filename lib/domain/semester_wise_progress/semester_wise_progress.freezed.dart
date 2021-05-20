// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'semester_wise_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SemesterWiseProgress _$SemesterWiseProgressFromJson(Map<String, dynamic> json) {
  return _SemesterWiseProgress.fromJson(json);
}

/// @nodoc
class _$SemesterWiseProgressTearOff {
  const _$SemesterWiseProgressTearOff();

  _SemesterWiseProgress call(String semester, int expected, int actual) {
    return _SemesterWiseProgress(
      semester,
      expected,
      actual,
    );
  }

  SemesterWiseProgress fromJson(Map<String, Object> json) {
    return SemesterWiseProgress.fromJson(json);
  }
}

/// @nodoc
const $SemesterWiseProgress = _$SemesterWiseProgressTearOff();

/// @nodoc
mixin _$SemesterWiseProgress {
  String get semester => throw _privateConstructorUsedError;
  int get expected => throw _privateConstructorUsedError;
  int get actual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SemesterWiseProgressCopyWith<SemesterWiseProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemesterWiseProgressCopyWith<$Res> {
  factory $SemesterWiseProgressCopyWith(SemesterWiseProgress value,
          $Res Function(SemesterWiseProgress) then) =
      _$SemesterWiseProgressCopyWithImpl<$Res>;
  $Res call({String semester, int expected, int actual});
}

/// @nodoc
class _$SemesterWiseProgressCopyWithImpl<$Res>
    implements $SemesterWiseProgressCopyWith<$Res> {
  _$SemesterWiseProgressCopyWithImpl(this._value, this._then);

  final SemesterWiseProgress _value;
  // ignore: unused_field
  final $Res Function(SemesterWiseProgress) _then;

  @override
  $Res call({
    Object? semester = freezed,
    Object? expected = freezed,
    Object? actual = freezed,
  }) {
    return _then(_value.copyWith(
      semester: semester == freezed
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      expected: expected == freezed
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      actual: actual == freezed
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SemesterWiseProgressCopyWith<$Res>
    implements $SemesterWiseProgressCopyWith<$Res> {
  factory _$SemesterWiseProgressCopyWith(_SemesterWiseProgress value,
          $Res Function(_SemesterWiseProgress) then) =
      __$SemesterWiseProgressCopyWithImpl<$Res>;
  @override
  $Res call({String semester, int expected, int actual});
}

/// @nodoc
class __$SemesterWiseProgressCopyWithImpl<$Res>
    extends _$SemesterWiseProgressCopyWithImpl<$Res>
    implements _$SemesterWiseProgressCopyWith<$Res> {
  __$SemesterWiseProgressCopyWithImpl(
      _SemesterWiseProgress _value, $Res Function(_SemesterWiseProgress) _then)
      : super(_value, (v) => _then(v as _SemesterWiseProgress));

  @override
  _SemesterWiseProgress get _value => super._value as _SemesterWiseProgress;

  @override
  $Res call({
    Object? semester = freezed,
    Object? expected = freezed,
    Object? actual = freezed,
  }) {
    return _then(_SemesterWiseProgress(
      semester == freezed
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      expected == freezed
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      actual == freezed
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SemesterWiseProgress implements _SemesterWiseProgress {
  const _$_SemesterWiseProgress(this.semester, this.expected, this.actual);

  factory _$_SemesterWiseProgress.fromJson(Map<String, dynamic> json) =>
      _$_$_SemesterWiseProgressFromJson(json);

  @override
  final String semester;
  @override
  final int expected;
  @override
  final int actual;

  @override
  String toString() {
    return 'SemesterWiseProgress(semester: $semester, expected: $expected, actual: $actual)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SemesterWiseProgress &&
            (identical(other.semester, semester) ||
                const DeepCollectionEquality()
                    .equals(other.semester, semester)) &&
            (identical(other.expected, expected) ||
                const DeepCollectionEquality()
                    .equals(other.expected, expected)) &&
            (identical(other.actual, actual) ||
                const DeepCollectionEquality().equals(other.actual, actual)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(semester) ^
      const DeepCollectionEquality().hash(expected) ^
      const DeepCollectionEquality().hash(actual);

  @JsonKey(ignore: true)
  @override
  _$SemesterWiseProgressCopyWith<_SemesterWiseProgress> get copyWith =>
      __$SemesterWiseProgressCopyWithImpl<_SemesterWiseProgress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SemesterWiseProgressToJson(this);
  }
}

abstract class _SemesterWiseProgress implements SemesterWiseProgress {
  const factory _SemesterWiseProgress(
      String semester, int expected, int actual) = _$_SemesterWiseProgress;

  factory _SemesterWiseProgress.fromJson(Map<String, dynamic> json) =
      _$_SemesterWiseProgress.fromJson;

  @override
  String get semester => throw _privateConstructorUsedError;
  @override
  int get expected => throw _privateConstructorUsedError;
  @override
  int get actual => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SemesterWiseProgressCopyWith<_SemesterWiseProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
