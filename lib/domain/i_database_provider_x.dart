import 'package:dartz/dartz.dart';
import 'package:iub_student_monitoring_system/domain/failure/failure.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class IDatabaseProvider {
  // IDatabaseProvider();

  String get dbName;

  Database? get database;
  set database(Database? database);

  Future<Either<Failure, Unit>> loadDatabase();
  Future<void> query();

  void getStudentWisePLO(String studentId);
  void getDepartmentWisePLO(String deptId);
  Future<void> getCourseWisePLO(String studentId);
  void getCourseWisePLOChart(String studentId);
  void getStudentProgressView(String studentId, String year);
  void getSemesterWiseStudentProgress(String semester, String year);
  void getProgramAchievement(String program);
  void getCourseProgressView(String courseId, String year);
  void getVerdictTable(String courseId);
  void getNoOfPLOAchieved(String studentId);
  void getNoOfPLOAttempted(String studentId);
  void getMinLowestPLO(String studentId);
  void ploSuccessRate(String studentId);

  void getNumOfStudents(String deptId);
  void getNumOfFaculties(String deptId);
  void getNumOfCourses();
  void getAverageAchievedPLO();
  void getNumOfCoursesHead(String facultyId);
  void getNumOfSections(String facultyId);
  void getAverageSuccessRate(String facultyId);
  void getNumOfPLOsTaught(String facultyId);
}
