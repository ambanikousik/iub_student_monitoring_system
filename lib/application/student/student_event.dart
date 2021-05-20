part of 'student_bloc.dart';

@freezed
class StudentEvent with _$StudentEvent {
  const factory StudentEvent.load() = LoadStudentData;
  const factory StudentEvent.loadSemesterWiseProgress(String year) =
      LoadSemesterWiseProgressData;
}
