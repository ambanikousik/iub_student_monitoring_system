import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iub_student_monitoring_system/domain/i_student_provider.dart';
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
      final Map<String, double> stdPlo = await studentProvider.studentWisePLO();
      final int achieved = await studentProvider.getNumberOfPLOAchieved();
      final int attempted = await studentProvider.getNoOfPLOAttempted();
      final double successRate =
          studentProvider.getPLOSuccessRate(achieved, attempted);
      yield state.copyWith(
          ploAchieved: achieved,
          ploAttempted: attempted,
          successRate: successRate,
          user: DBProvider.instance().user!,
          lowestPlo: await studentProvider
              .getLowestPLO()
              .then((value) => "${value.plo}\n(${value.details})"),
          studentPlo: stdPlo);
    });
    // TODO: implement mapEventToState
  }
}
