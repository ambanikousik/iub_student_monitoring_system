part of 'student_bloc.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState(
          int ploAchieved, int ploAttempted, int lowestPlo, int successRate) =
      _StudentState;

  factory StudentState.initial() => const StudentState(0, 0, 0, 0);
}
