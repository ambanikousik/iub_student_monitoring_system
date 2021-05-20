// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'course_wise_plo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseWisePlo _$CourseWisePloFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'data':
      return CourseWisePloData.fromJson(json);
    case 'course':
      return CourseWisePloScoreData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$CourseWisePloTearOff {
  const _$CourseWisePloTearOff();

  CourseWisePloData data(
      String course, List<CourseWisePloScoreData> courseDataList) {
    return CourseWisePloData(
      course,
      courseDataList,
    );
  }

  CourseWisePloScoreData course(String plo, double percentage) {
    return CourseWisePloScoreData(
      plo,
      percentage,
    );
  }

  CourseWisePlo fromJson(Map<String, Object> json) {
    return CourseWisePlo.fromJson(json);
  }
}

/// @nodoc
const $CourseWisePlo = _$CourseWisePloTearOff();

/// @nodoc
mixin _$CourseWisePlo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)
        data,
    required TResult Function(String plo, double percentage) course,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)?
        data,
    TResult Function(String plo, double percentage)? course,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseWisePloData value) data,
    required TResult Function(CourseWisePloScoreData value) course,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseWisePloData value)? data,
    TResult Function(CourseWisePloScoreData value)? course,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseWisePloCopyWith<$Res> {
  factory $CourseWisePloCopyWith(
          CourseWisePlo value, $Res Function(CourseWisePlo) then) =
      _$CourseWisePloCopyWithImpl<$Res>;
}

/// @nodoc
class _$CourseWisePloCopyWithImpl<$Res>
    implements $CourseWisePloCopyWith<$Res> {
  _$CourseWisePloCopyWithImpl(this._value, this._then);

  final CourseWisePlo _value;
  // ignore: unused_field
  final $Res Function(CourseWisePlo) _then;
}

/// @nodoc
abstract class $CourseWisePloDataCopyWith<$Res> {
  factory $CourseWisePloDataCopyWith(
          CourseWisePloData value, $Res Function(CourseWisePloData) then) =
      _$CourseWisePloDataCopyWithImpl<$Res>;
  $Res call({String course, List<CourseWisePloScoreData> courseDataList});
}

/// @nodoc
class _$CourseWisePloDataCopyWithImpl<$Res>
    extends _$CourseWisePloCopyWithImpl<$Res>
    implements $CourseWisePloDataCopyWith<$Res> {
  _$CourseWisePloDataCopyWithImpl(
      CourseWisePloData _value, $Res Function(CourseWisePloData) _then)
      : super(_value, (v) => _then(v as CourseWisePloData));

  @override
  CourseWisePloData get _value => super._value as CourseWisePloData;

  @override
  $Res call({
    Object? course = freezed,
    Object? courseDataList = freezed,
  }) {
    return _then(CourseWisePloData(
      course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
      courseDataList == freezed
          ? _value.courseDataList
          : courseDataList // ignore: cast_nullable_to_non_nullable
              as List<CourseWisePloScoreData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseWisePloData implements CourseWisePloData {
  const _$CourseWisePloData(this.course, this.courseDataList);

  factory _$CourseWisePloData.fromJson(Map<String, dynamic> json) =>
      _$_$CourseWisePloDataFromJson(json);

  @override
  final String course;
  @override
  final List<CourseWisePloScoreData> courseDataList;

  @override
  String toString() {
    return 'CourseWisePlo.data(course: $course, courseDataList: $courseDataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CourseWisePloData &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)) &&
            (identical(other.courseDataList, courseDataList) ||
                const DeepCollectionEquality()
                    .equals(other.courseDataList, courseDataList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(course) ^
      const DeepCollectionEquality().hash(courseDataList);

  @JsonKey(ignore: true)
  @override
  $CourseWisePloDataCopyWith<CourseWisePloData> get copyWith =>
      _$CourseWisePloDataCopyWithImpl<CourseWisePloData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)
        data,
    required TResult Function(String plo, double percentage) course,
  }) {
    return data(this.course, courseDataList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)?
        data,
    TResult Function(String plo, double percentage)? course,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.course, courseDataList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseWisePloData value) data,
    required TResult Function(CourseWisePloScoreData value) course,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseWisePloData value)? data,
    TResult Function(CourseWisePloScoreData value)? course,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CourseWisePloDataToJson(this)..['runtimeType'] = 'data';
  }
}

abstract class CourseWisePloData implements CourseWisePlo {
  const factory CourseWisePloData(
          String course, List<CourseWisePloScoreData> courseDataList) =
      _$CourseWisePloData;

  factory CourseWisePloData.fromJson(Map<String, dynamic> json) =
      _$CourseWisePloData.fromJson;

  String get course => throw _privateConstructorUsedError;
  List<CourseWisePloScoreData> get courseDataList =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseWisePloDataCopyWith<CourseWisePloData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseWisePloScoreDataCopyWith<$Res> {
  factory $CourseWisePloScoreDataCopyWith(CourseWisePloScoreData value,
          $Res Function(CourseWisePloScoreData) then) =
      _$CourseWisePloScoreDataCopyWithImpl<$Res>;
  $Res call({String plo, double percentage});
}

/// @nodoc
class _$CourseWisePloScoreDataCopyWithImpl<$Res>
    extends _$CourseWisePloCopyWithImpl<$Res>
    implements $CourseWisePloScoreDataCopyWith<$Res> {
  _$CourseWisePloScoreDataCopyWithImpl(CourseWisePloScoreData _value,
      $Res Function(CourseWisePloScoreData) _then)
      : super(_value, (v) => _then(v as CourseWisePloScoreData));

  @override
  CourseWisePloScoreData get _value => super._value as CourseWisePloScoreData;

  @override
  $Res call({
    Object? plo = freezed,
    Object? percentage = freezed,
  }) {
    return _then(CourseWisePloScoreData(
      plo == freezed
          ? _value.plo
          : plo // ignore: cast_nullable_to_non_nullable
              as String,
      percentage == freezed
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseWisePloScoreData implements CourseWisePloScoreData {
  const _$CourseWisePloScoreData(this.plo, this.percentage);

  factory _$CourseWisePloScoreData.fromJson(Map<String, dynamic> json) =>
      _$_$CourseWisePloScoreDataFromJson(json);

  @override
  final String plo;
  @override
  final double percentage;

  @override
  String toString() {
    return 'CourseWisePlo.course(plo: $plo, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CourseWisePloScoreData &&
            (identical(other.plo, plo) ||
                const DeepCollectionEquality().equals(other.plo, plo)) &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(plo) ^
      const DeepCollectionEquality().hash(percentage);

  @JsonKey(ignore: true)
  @override
  $CourseWisePloScoreDataCopyWith<CourseWisePloScoreData> get copyWith =>
      _$CourseWisePloScoreDataCopyWithImpl<CourseWisePloScoreData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)
        data,
    required TResult Function(String plo, double percentage) course,
  }) {
    return course(plo, percentage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String course, List<CourseWisePloScoreData> courseDataList)?
        data,
    TResult Function(String plo, double percentage)? course,
    required TResult orElse(),
  }) {
    if (course != null) {
      return course(plo, percentage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseWisePloData value) data,
    required TResult Function(CourseWisePloScoreData value) course,
  }) {
    return course(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseWisePloData value)? data,
    TResult Function(CourseWisePloScoreData value)? course,
    required TResult orElse(),
  }) {
    if (course != null) {
      return course(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CourseWisePloScoreDataToJson(this)..['runtimeType'] = 'course';
  }
}

abstract class CourseWisePloScoreData implements CourseWisePlo {
  const factory CourseWisePloScoreData(String plo, double percentage) =
      _$CourseWisePloScoreData;

  factory CourseWisePloScoreData.fromJson(Map<String, dynamic> json) =
      _$CourseWisePloScoreData.fromJson;

  String get plo => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseWisePloScoreDataCopyWith<CourseWisePloScoreData> get copyWith =>
      throw _privateConstructorUsedError;
}
