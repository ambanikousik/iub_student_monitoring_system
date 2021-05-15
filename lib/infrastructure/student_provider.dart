import 'package:iub_student_monitoring_system/domain/i_student_info_provider.dart';

class StudentProvider extends IStudentProvider {
  StudentProvider._();
  factory StudentProvider.initiate(String studentID) {
    studentID = studentID;
    final StudentProvider databaseProvider = StudentProvider._();
    // databaseProvider.loadDatabase();
    return databaseProvider;
  }

  @override
  void getLowestPLO() {
    // TODO: implement getLowestPLO
  }

  @override
  void getNoOfPLOAttempted() {
    // TODO: implement getNoOfPLOAttempted
  }

  @override
  void getNumberOfPLOAchieved() {
    // TODO: implement getNumberOfPLOAchieved
  }

  @override
  void getPLOSuccessRate() {
    // TODO: implement getPLOSuccessRate
  }

  @override
  void getCourseWisePLO() {
    // TODO: implement getCourseWisePLO
  }

  @override
  void getDepartmentWisePLO() {
    // TODO: implement getDepartmentWisePLO
  }

  @override
  void getStudentProgressView() {
    // TODO: implement getStudentProgressView
  }

  @override
  void studentWisePLO() {
    // TODO: implement studentWisePLO
  }
}
