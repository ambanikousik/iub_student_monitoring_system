import 'package:freezed_annotation/freezed_annotation.dart';
part 'semester_wise_progress.freezed.dart';
part 'semester_wise_progress.g.dart';

@freezed
class SemesterWiseProgress with _$SemesterWiseProgress {
  const factory SemesterWiseProgress(
    String semester,
    int expected,
    int actual,
  ) = _SemesterWiseProgress;

  factory SemesterWiseProgress.fromJson(Map<String, dynamic> json) =>
      _$SemesterWiseProgressFromJson(json);
}
