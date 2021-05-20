import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iub_student_monitoring_system/domain/course_wise_plo/course_wise_plo.dart';
import 'package:iub_student_monitoring_system/domain/i_student_provider.dart';
import 'package:iub_student_monitoring_system/domain/semester_wise_progress/semester_wise_progress.dart';
import 'package:iub_student_monitoring_system/domain/user/user.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';

part 'student_event.dart';
part 'student_state.dart';
part 'student_bloc.freezed.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final IStudentProvider studentProvider;
  StudentBloc(this.studentProvider) : super(StudentState.initial());

  @override
  Stream<StudentState> mapEventToState(
    StudentEvent event,
  ) async* {
    yield* event.map(load: (e) async* {
      final List<CourseWisePloData> courseWisePloList =
          await studentProvider.getCourseWisePLO();
      final List<String> years = await studentProvider.getYears();
      final Map<String, double> deptPlo =
          await studentProvider.getDepartmentWisePLO();
      final Map<String, double> stdPlo = await studentProvider.studentWisePLO();
      final int achieved = await studentProvider.getNumberOfPLOAchieved();
      final int attempted = await studentProvider.getNoOfPLOAttempted();
      final double successRate =
          studentProvider.getPLOSuccessRate(achieved, attempted);
      yield state.copyWith(
          ploAchieved: achieved,
          ploAttempted: attempted,
          successRate: successRate,
          courseWisePloList: courseWisePloList,
          user: DBProvider.instance().user!,
          lowestPlo: await studentProvider
              .getLowestPLO()
              .then((value) => "${value.plo}\n(${value.details})"),
          studentPlo: stdPlo,
          deptPlo: deptPlo,
          years: years);
    }, loadSemesterWiseProgress: (LoadSemesterWiseProgressData value) async* {
      final List<SemesterWiseProgress> progress =
          await studentProvider.getStudentProgressView(value.year);

      yield state.copyWith(semesterWiseProgress: progress);
    });
    // TODO: implement mapEventToState
  }
}
