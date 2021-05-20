import 'package:iub_student_monitoring_system/domain/course_wise_plo/course_wise_plo.dart';
import 'package:iub_student_monitoring_system/domain/plo/plo.dart';

import 'semester_wise_progress/semester_wise_progress.dart';

abstract class IStudentProvider {
  Future<int> getNumberOfPLOAchieved();
  Future<int> getNoOfPLOAttempted();
  Future<Plo> getLowestPLO();
  double getPLOSuccessRate(int achieved, int attempted);
  Future<Map<String, double>> studentWisePLO();
  Future<String> getStdDepartmentId();
  Future<String> getSemesterName(int id);
  Future<List<String>> getYears();
  Future<Map<String, double>> getDepartmentWisePLO();
  Future<List<SemesterWiseProgress>> getStudentProgressView(String year);
  Future<List<CourseWisePloData>> getCourseWisePLO();
}
