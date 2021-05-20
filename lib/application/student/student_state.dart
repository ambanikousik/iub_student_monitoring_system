part of 'student_bloc.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState(
    User user,
    int ploAchieved,
    int ploAttempted,
    String lowestPlo,
    double successRate,
    List<String> years,
    Map<String, double> studentPlo,
    Map<String, double> deptPlo,
    List<SemesterWiseProgress> semesterWiseProgress,
    List<CourseWisePloData> courseWisePloList,
  ) = _StudentState;

  factory StudentState.initial() => const StudentState(
      User(0, 'userName', 'lastName', 'firstName'),
      0,
      0,
      'n/a',
      0.0, [], {}, {}, [], []);
}
