// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'plo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plo _$PloFromJson(Map<String, dynamic> json) {
  return _Plo.fromJson(json);
}

/// @nodoc
class _$PloTearOff {
  const _$PloTearOff();

  _Plo call(@JsonKey(name: 'ploNo') String plo, String details,
      @JsonKey(name: 'program_id') String programId) {
    return _Plo(
      plo,
      details,
      programId,
    );
  }

  Plo fromJson(Map<String, Object> json) {
    return Plo.fromJson(json);
  }
}

/// @nodoc
const $Plo = _$PloTearOff();

/// @nodoc
mixin _$Plo {
  @JsonKey(name: 'ploNo')
  String get plo => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'program_id')
  String get programId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PloCopyWith<Plo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PloCopyWith<$Res> {
  factory $PloCopyWith(Plo value, $Res Function(Plo) then) =
      _$PloCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ploNo') String plo,
      String details,
      @JsonKey(name: 'program_id') String programId});
}

/// @nodoc
class _$PloCopyWithImpl<$Res> implements $PloCopyWith<$Res> {
  _$PloCopyWithImpl(this._value, this._then);

  final Plo _value;
  // ignore: unused_field
  final $Res Function(Plo) _then;

  @override
  $Res call({
    Object? plo = freezed,
    Object? details = freezed,
    Object? programId = freezed,
  }) {
    return _then(_value.copyWith(
      plo: plo == freezed
          ? _value.plo
          : plo // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      programId: programId == freezed
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PloCopyWith<$Res> implements $PloCopyWith<$Res> {
  factory _$PloCopyWith(_Plo value, $Res Function(_Plo) then) =
      __$PloCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ploNo') String plo,
      String details,
      @JsonKey(name: 'program_id') String programId});
}

/// @nodoc
class __$PloCopyWithImpl<$Res> extends _$PloCopyWithImpl<$Res>
    implements _$PloCopyWith<$Res> {
  __$PloCopyWithImpl(_Plo _value, $Res Function(_Plo) _then)
      : super(_value, (v) => _then(v as _Plo));

  @override
  _Plo get _value => super._value as _Plo;

  @override
  $Res call({
    Object? plo = freezed,
    Object? details = freezed,
    Object? programId = freezed,
  }) {
    return _then(_Plo(
      plo == freezed
          ? _value.plo
          : plo // ignore: cast_nullable_to_non_nullable
              as String,
      details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      programId == freezed
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plo implements _Plo {
  const _$_Plo(@JsonKey(name: 'ploNo') this.plo, this.details,
      @JsonKey(name: 'program_id') this.programId);

  factory _$_Plo.fromJson(Map<String, dynamic> json) => _$_$_PloFromJson(json);

  @override
  @JsonKey(name: 'ploNo')
  final String plo;
  @override
  final String details;
  @override
  @JsonKey(name: 'program_id')
  final String programId;

  @override
  String toString() {
    return 'Plo(plo: $plo, details: $details, programId: $programId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Plo &&
            (identical(other.plo, plo) ||
                const DeepCollectionEquality().equals(other.plo, plo)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.programId, programId) ||
                const DeepCollectionEquality()
                    .equals(other.programId, programId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(plo) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(programId);

  @JsonKey(ignore: true)
  @override
  _$PloCopyWith<_Plo> get copyWith =>
      __$PloCopyWithImpl<_Plo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PloToJson(this);
  }
}

abstract class _Plo implements Plo {
  const factory _Plo(@JsonKey(name: 'ploNo') String plo, String details,
      @JsonKey(name: 'program_id') String programId) = _$_Plo;

  factory _Plo.fromJson(Map<String, dynamic> json) = _$_Plo.fromJson;

  @override
  @JsonKey(name: 'ploNo')
  String get plo => throw _privateConstructorUsedError;
  @override
  String get details => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'program_id')
  String get programId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PloCopyWith<_Plo> get copyWith => throw _privateConstructorUsedError;
}
