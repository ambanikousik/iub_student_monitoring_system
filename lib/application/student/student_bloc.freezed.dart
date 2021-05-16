// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'student_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StudentEventTearOff {
  const _$StudentEventTearOff();

  LoadStudentData load() {
    return const LoadStudentData();
  }
}

/// @nodoc
const $StudentEvent = _$StudentEventTearOff();

/// @nodoc
mixin _$StudentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStudentData value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStudentData value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentEventCopyWith<$Res> {
  factory $StudentEventCopyWith(
          StudentEvent value, $Res Function(StudentEvent) then) =
      _$StudentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StudentEventCopyWithImpl<$Res> implements $StudentEventCopyWith<$Res> {
  _$StudentEventCopyWithImpl(this._value, this._then);

  final StudentEvent _value;
  // ignore: unused_field
  final $Res Function(StudentEvent) _then;
}

/// @nodoc
abstract class $LoadStudentDataCopyWith<$Res> {
  factory $LoadStudentDataCopyWith(
          LoadStudentData value, $Res Function(LoadStudentData) then) =
      _$LoadStudentDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadStudentDataCopyWithImpl<$Res>
    extends _$StudentEventCopyWithImpl<$Res>
    implements $LoadStudentDataCopyWith<$Res> {
  _$LoadStudentDataCopyWithImpl(
      LoadStudentData _value, $Res Function(LoadStudentData) _then)
      : super(_value, (v) => _then(v as LoadStudentData));

  @override
  LoadStudentData get _value => super._value as LoadStudentData;
}

/// @nodoc

class _$LoadStudentData implements LoadStudentData {
  const _$LoadStudentData();

  @override
  String toString() {
    return 'StudentEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadStudentData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStudentData value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStudentData value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadStudentData implements StudentEvent {
  const factory LoadStudentData() = _$LoadStudentData;
}

/// @nodoc
class _$StudentStateTearOff {
  const _$StudentStateTearOff();

  _StudentState call(User user, int ploAchieved, int ploAttempted,
      String lowestPlo, double successRate, Map<String, double> studentPlo) {
    return _StudentState(
      user,
      ploAchieved,
      ploAttempted,
      lowestPlo,
      successRate,
      studentPlo,
    );
  }
}

/// @nodoc
const $StudentState = _$StudentStateTearOff();

/// @nodoc
mixin _$StudentState {
  User get user => throw _privateConstructorUsedError;
  int get ploAchieved => throw _privateConstructorUsedError;
  int get ploAttempted => throw _privateConstructorUsedError;
  String get lowestPlo => throw _privateConstructorUsedError;
  double get successRate => throw _privateConstructorUsedError;
  Map<String, double> get studentPlo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentStateCopyWith<StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentStateCopyWith<$Res> {
  factory $StudentStateCopyWith(
          StudentState value, $Res Function(StudentState) then) =
      _$StudentStateCopyWithImpl<$Res>;
  $Res call(
      {User user,
      int ploAchieved,
      int ploAttempted,
      String lowestPlo,
      double successRate,
      Map<String, double> studentPlo});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$StudentStateCopyWithImpl<$Res> implements $StudentStateCopyWith<$Res> {
  _$StudentStateCopyWithImpl(this._value, this._then);

  final StudentState _value;
  // ignore: unused_field
  final $Res Function(StudentState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? ploAchieved = freezed,
    Object? ploAttempted = freezed,
    Object? lowestPlo = freezed,
    Object? successRate = freezed,
    Object? studentPlo = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      ploAchieved: ploAchieved == freezed
          ? _value.ploAchieved
          : ploAchieved // ignore: cast_nullable_to_non_nullable
              as int,
      ploAttempted: ploAttempted == freezed
          ? _value.ploAttempted
          : ploAttempted // ignore: cast_nullable_to_non_nullable
              as int,
      lowestPlo: lowestPlo == freezed
          ? _value.lowestPlo
          : lowestPlo // ignore: cast_nullable_to_non_nullable
              as String,
      successRate: successRate == freezed
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      studentPlo: studentPlo == freezed
          ? _value.studentPlo
          : studentPlo // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$StudentStateCopyWith<$Res>
    implements $StudentStateCopyWith<$Res> {
  factory _$StudentStateCopyWith(
          _StudentState value, $Res Function(_StudentState) then) =
      __$StudentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user,
      int ploAchieved,
      int ploAttempted,
      String lowestPlo,
      double successRate,
      Map<String, double> studentPlo});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$StudentStateCopyWithImpl<$Res> extends _$StudentStateCopyWithImpl<$Res>
    implements _$StudentStateCopyWith<$Res> {
  __$StudentStateCopyWithImpl(
      _StudentState _value, $Res Function(_StudentState) _then)
      : super(_value, (v) => _then(v as _StudentState));

  @override
  _StudentState get _value => super._value as _StudentState;

  @override
  $Res call({
    Object? user = freezed,
    Object? ploAchieved = freezed,
    Object? ploAttempted = freezed,
    Object? lowestPlo = freezed,
    Object? successRate = freezed,
    Object? studentPlo = freezed,
  }) {
    return _then(_StudentState(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      ploAchieved == freezed
          ? _value.ploAchieved
          : ploAchieved // ignore: cast_nullable_to_non_nullable
              as int,
      ploAttempted == freezed
          ? _value.ploAttempted
          : ploAttempted // ignore: cast_nullable_to_non_nullable
              as int,
      lowestPlo == freezed
          ? _value.lowestPlo
          : lowestPlo // ignore: cast_nullable_to_non_nullable
              as String,
      successRate == freezed
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      studentPlo == freezed
          ? _value.studentPlo
          : studentPlo // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc

class _$_StudentState implements _StudentState {
  const _$_StudentState(this.user, this.ploAchieved, this.ploAttempted,
      this.lowestPlo, this.successRate, this.studentPlo);

  @override
  final User user;
  @override
  final int ploAchieved;
  @override
  final int ploAttempted;
  @override
  final String lowestPlo;
  @override
  final double successRate;
  @override
  final Map<String, double> studentPlo;

  @override
  String toString() {
    return 'StudentState(user: $user, ploAchieved: $ploAchieved, ploAttempted: $ploAttempted, lowestPlo: $lowestPlo, successRate: $successRate, studentPlo: $studentPlo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StudentState &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.ploAchieved, ploAchieved) ||
                const DeepCollectionEquality()
                    .equals(other.ploAchieved, ploAchieved)) &&
            (identical(other.ploAttempted, ploAttempted) ||
                const DeepCollectionEquality()
                    .equals(other.ploAttempted, ploAttempted)) &&
            (identical(other.lowestPlo, lowestPlo) ||
                const DeepCollectionEquality()
                    .equals(other.lowestPlo, lowestPlo)) &&
            (identical(other.successRate, successRate) ||
                const DeepCollectionEquality()
                    .equals(other.successRate, successRate)) &&
            (identical(other.studentPlo, studentPlo) ||
                const DeepCollectionEquality()
                    .equals(other.studentPlo, studentPlo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(ploAchieved) ^
      const DeepCollectionEquality().hash(ploAttempted) ^
      const DeepCollectionEquality().hash(lowestPlo) ^
      const DeepCollectionEquality().hash(successRate) ^
      const DeepCollectionEquality().hash(studentPlo);

  @JsonKey(ignore: true)
  @override
  _$StudentStateCopyWith<_StudentState> get copyWith =>
      __$StudentStateCopyWithImpl<_StudentState>(this, _$identity);
}

abstract class _StudentState implements StudentState {
  const factory _StudentState(
      User user,
      int ploAchieved,
      int ploAttempted,
      String lowestPlo,
      double successRate,
      Map<String, double> studentPlo) = _$_StudentState;

  @override
  User get user => throw _privateConstructorUsedError;
  @override
  int get ploAchieved => throw _privateConstructorUsedError;
  @override
  int get ploAttempted => throw _privateConstructorUsedError;
  @override
  String get lowestPlo => throw _privateConstructorUsedError;
  @override
  double get successRate => throw _privateConstructorUsedError;
  @override
  Map<String, double> get studentPlo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StudentStateCopyWith<_StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}
