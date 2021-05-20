// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_wise_plo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseWisePloData _$_$CourseWisePloDataFromJson(Map<String, dynamic> json) {
  return _$CourseWisePloData(
    json['course'] as String,
    (json['courseDataList'] as List<dynamic>)
        .map((e) => CourseWisePloScoreData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$CourseWisePloDataToJson(
        _$CourseWisePloData instance) =>
    <String, dynamic>{
      'course': instance.course,
      'courseDataList': instance.courseDataList.map((e) => e.toJson()).toList(),
    };

_$CourseWisePloScoreData _$_$CourseWisePloScoreDataFromJson(
    Map<String, dynamic> json) {
  return _$CourseWisePloScoreData(
    json['plo'] as String,
    (json['percentage'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$CourseWisePloScoreDataToJson(
        _$CourseWisePloScoreData instance) =>
    <String, dynamic>{
      'plo': instance.plo,
      'percentage': instance.percentage,
    };
