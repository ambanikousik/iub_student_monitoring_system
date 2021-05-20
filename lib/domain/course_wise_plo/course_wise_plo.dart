import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_wise_plo.freezed.dart';
part 'course_wise_plo.g.dart';

@freezed
class CourseWisePlo with _$CourseWisePlo {
  const factory CourseWisePlo.data(
          String course, List<CourseWisePloScoreData> courseDataList) =
      CourseWisePloData;
  const factory CourseWisePlo.course(String plo, double percentage) =
      CourseWisePloScoreData;

  factory CourseWisePlo.fromJson(Map<String, dynamic> json) =>
      _$CourseWisePloFromJson(json);
}
