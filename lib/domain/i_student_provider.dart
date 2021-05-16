import 'package:iub_student_monitoring_system/domain/plo/plo.dart';

abstract class IStudentProvider {
  Future<int> getNumberOfPLOAchieved();
  Future<int> getNoOfPLOAttempted();
  Future<Plo> getLowestPLO();
  double getPLOSuccessRate(int achieved, int attempted);
  Future<Map<String, double>> studentWisePLO();
  void getDepartmentWisePLO();
  void getStudentProgressView();
  void getCourseWisePLO();
}
