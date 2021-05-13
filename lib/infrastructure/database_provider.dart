import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:iub_student_monitoring_system/domain/failure/failure.dart';
import 'package:iub_student_monitoring_system/domain/i_database_provider.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseProvider extends IDatabaseProvider {
  DatabaseProvider._();

  @override
  Database? database;

  @override
  String get dbName => 'db.sqlite3';
  @override
  Future<Either<Failure, Unit>> loadDatabase() async {
    final String databasepath = await getDatabasesPath();
    final String path = join(databasepath, dbName);

    final bool dbExists = await databaseExists(path);
    Logger().i('Database existance: $dbExists');

    if (!dbExists) {
      await Directory(dirname(path)).create(recursive: true);
      try {} catch (e) {
        Logger().e(e);
        return left(Failure(e.toString()));
      }

      // copy from assets
      final ByteData data = await rootBundle.load(join('assets', dbName));
      final List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      //write
      await File(path).writeAsBytes(bytes, flush: true);
    }
    database = await openDatabase(path);
    Logger().i('database opened');
    return right(unit);
  }

  factory DatabaseProvider.load() {
    final DatabaseProvider databaseProvider = DatabaseProvider._();
    databaseProvider.loadDatabase();
    return databaseProvider;
  }

  @override
  Future<void> query() async {
    // final List<Map<String, Object?>> all = await database!.query('auth_group');
    final List<Map<String, Object?>> queryResult =
        await database!.rawQuery('SELECT * FROM "auth_group"');

    Logger().i(queryResult);
  }

  @override
  void getAverageAchievedPLO() {
    // TODO: implement getAverageAchievedPLO
  }

  @override
  void getAverageSuccessRate(String facultyId) {
    // TODO: implement getAverageSuccessRate
  }

  @override
  void getCourseProgressView(String courseId, String year) {
    // TODO: implement getCourseProgressView
  }

  @override
  Future<void> getCourseWisePLO(String studentId) async {
    final String query = '''
            SELECT DISTINCT co.course_id, co.coNo, p.ploNo, (PLO / TotalComark * 100) AS PLOpercentage
                FROM mainapp_plo_t p, mainapp_co_t co, (
                    SELECT DISTINCT c.course_id,c.coNo, c.plo_id, SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                    FROM mainapp_enrollment_t en,
                        mainapp_evaluation_t e,
                        mainapp_assessment_t a,
                        mainapp_co_t c,
                        mainapp_plo_t p
                    WHERE en.student_id = $studentId
                        AND en.enrollmentID = e.enrollment_id
                        AND e.assessment_id = a.assessmentNo
                        AND a.co_id = c.id
                        AND c.plo_id = p.ploNo
                    GROUP BY en.section_id,c.plo_id
                    ORDER BY c.plo_id
                ) ploPer
            WHERE co.coNo = ploPer.coNo
                AND p.ploNo = ploPer.plo_id
                AND co.course_id = ploPer.course_id;
        ''';
    // Logger().i(query);

    final List<Map<String, Object?>> queryResult =
        await database!.rawQuery(query);

    Logger().i(queryResult);
  }

  @override
  void getCourseWisePLOChart(String studentId) {
    final String query = '''
            SELECT DISTINCT co.course_id, co.coNo, p.ploNo, (PLO / TotalComark * 100) AS PLOpercentage
                FROM mainapp_plo_t p, mainapp_co_t co, (
                    SELECT DISTINCT c.course_id,c.coNo, c.plo_id, SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                    FROM mainapp_enrollment_t en,
                        mainapp_evaluation_t e,
                        mainapp_assessment_t a,
                        mainapp_co_t c,
                        mainapp_plo_t p
                    WHERE en.student_id = $studentId
                        AND en.enrollmentID = e.enrollment_id
                        AND e.assessment_id = a.assessmentNo
                        AND a.co_id = c.id
                        AND c.plo_id = p.ploNo
                    GROUP BY en.section_id,c.plo_id
                    ORDER BY c.plo_id
                ) ploPer
            WHERE co.coNo = ploPer.coNo
                AND p.ploNo = ploPer.plo_id
                AND co.course_id = ploPer.course_id;
        ''';
    Logger().i(query);
  }

  @override
  void getDepartmentWisePLO(String deptId) {
    final String query = '''
                SELECT AVG(TotalPlo.PLOpercentage) AS ActualPlo
                FROM (
                    SELECT (PLO / TotalComark * 100) AS PLOpercentage
                        FROM (
                            SELECT SUM(e.obtainedMarks) AS PLO, SUM(a.marks) AS TotalCoMark
                            FROM mainapp_enrollment_t en,
                                mainapp_evaluation_t e,
                                mainapp_assessment_t a,
                                mainapp_co_t c,
                                mainapp_plo_t p,
                                mainapp_student_t st
                            WHERE st.department_id = $deptId
                            AND st.studentID = en.student_id
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = '{}'
                            GROUP BY en.section_id
                        ) ploPer
                    ) TotalPlo;
            ''';
    Logger().i(query);
  }

  @override
  void getMinLowestPLO(String studentId) {
    // TODO: implement getMinLowestPLO
  }

  @override
  void getNoOfPLOAchieved(String studentId) {
    // TODO: implement getNoOfPLOAchieved
  }

  @override
  void getNoOfPLOAttempted(String studentId) {
    // TODO: implement getNoOfPLOAttempted
  }

  @override
  void getNumOfCourses() {
    // TODO: implement getNumOfCourses
  }

  @override
  void getNumOfCoursesHead(String facultyId) {
    // TODO: implement getNumOfCoursesHead
  }

  @override
  void getNumOfFaculties(String deptId) {
    // TODO: implement getNumOfFaculties
  }

  @override
  void getNumOfPLOsTaught(String facultyId) {
    final String query = '''
            SELECT COUNT(ploNo) AS TotalNoPlotaught
            FROM (
                    SELECT course_id, coNo, ploNo, COUNT(TotalPlo.PLOpercentage) AS Acheive
                    FROM (
                            SELECT co.course_id, co.coNo, p.ploNo, (PLO / TotalComark * 100) AS PLOpercentage
                            FROM mainapp_plo_t p,
                                mainapp_co_t co,
                                (
                                    SELECT en.student_id,
                                            c.course_id,
                                            c.coNo,
                                            c.plo_id,
                                            SUM(DISTINCT e.obtainedMarks) AS PLO,
                                            SUM(DISTINCT a.marks)         AS TotalCoMark
                                    FROM mainapp_enrollment_t en,
                                            mainapp_section_t sec,
                                            mainapp_evaluation_t e,
                                            mainapp_assessment_t a,
                                            mainapp_co_t c,
                                            mainapp_plo_t p
                                    WHERE en.enrollmentID = e.enrollment_id
                                        AND en.section_id = sec.id
                                        AND faculty_id = $facultyId
                                        AND e.assessment_id = a.assessmentNo
                                        AND a.co_id = c.id
                                        AND c.plo_id = p.ploNo
                                    GROUP BY student_id, c.course_id, c.coNo, p.ploNo
                                ) ploPer
                            WHERE co.coNo = ploPer.coNo
                                AND p.ploNo = ploPer.plo_id
                                AND co.course_id = ploPer.course_id
                            GROUP BY student_id, co.course_id, co.coNo, ploNo

                        ) TotalPlo

                    GROUP BY course_id, coNo, ploNo
                )
        ''';

    Logger().i(query);
    // TODO: implement getNumOfPLOsTaught
  }

  @override
  void getNumOfSections(String facultyId) {
    // TODO: implement getNumOfSections
  }

  @override
  void getNumOfStudents(String deptId) {
    // TODO: implement getNumOfStudents
  }

  @override
  void getProgramAchievement(String program) {
    final String query = '''
                SELECT COUNT(Acheived.ActualPlo)
                FROM (
                        SELECT AVG(TotalPlo.PLOpercentage) AS ActualPlo
                        FROM (
                                SELECT student_id,(PLO / TotalComark * 100) AS PLOpercentage
                                FROM (
                                        SELECT  en.student_id,SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                                        FROM mainapp_enrollment_t en,
                                                mainapp_evaluation_t e,
                                                mainapp_assessment_t a,
                                                mainapp_co_t c,
                                                mainapp_plo_t p,
                                                mainapp_program_t pr
                                        WHERE p.program_id = pr.programID
                                            AND pr.programID = $program
                                            AND en.enrollmentID = e.enrollment_id
                                            AND e.assessment_id = a.assessmentNo
                                            AND a.co_id = c.id
                                            AND c.plo_id = '{}'
                                        GROUP BY en.student_id
                                    ) ploPer
                            GROUP BY student_id
                            ) TotalPlo
                GROUP BY student_id
                    ) Acheived
            ''';

    Logger().i(query);
    // TODO: implement getProgramAchievement
  }

  @override
  void getSemesterWiseStudentProgress(String semester, String year) {
    final String query = '''
                SELECT COUNT(Acheived.ActualPlo)
                    FROM (
                            SELECT AVG(TotalPlo.PLOpercentage) AS ActualPlo
                            FROM (
                                    SELECT student_id,(PLO / TotalComark * 100) AS PLOpercentage
                                    FROM (
                                            SELECT  en.student_id,SUM( e.obtainedMarks) AS PLO, SUM( a.marks) AS TotalCoMark
                                            FROM mainapp_enrollment_t en,
                                                    mainapp_evaluation_t e,
                                                    mainapp_assessment_t a,
                                                    mainapp_co_t c,
                                                    mainapp_plo_t p
                                            WHERE en.enrollmentID = e.enrollment_id
                                                AND en.semester = $semester
                                                AND en.year = $year
                                                AND e.assessment_id = a.assessmentNo
                                                AND a.co_id = c.id
                                                AND c.plo_id = '{}'
                                            GROUP BY en.student_id
                                        ) ploPer
                                GROUP BY student_id
                                ) TotalPlo
                    GROUP BY student_id
                        ) Acheived
                    WHERE Acheived.ActualPlo >= 40;
            ''';

    Logger().i(query);
  }

  @override
  void getStudentProgressView(String studentId, String year) {
    // TODO: implement getStudentProgressView
  }

  @override
  void getStudentWisePLO(String studentId) {
    final String query = '''
                SELECT AVG(TotalPlo.PLOpercentage) AS ActualPlo
                FROM (
                SELECT (PLO / TotalComark * 100) AS PLOpercentage
                FROM (
                        SELECT SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                        FROM mainapp_enrollment_t en,
                            mainapp_evaluation_t e,
                            mainapp_assessment_t a,
                            mainapp_co_t c,
                            mainapp_plo_t p
                        WHERE en.student_id = '$studentId
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = '{}'
                        GROUP BY en.section_id
                    ) ploPer
                ) TotalPlo;
            ''';

    Logger().i(query);
  }

  @override
  void getVerdictTable(String courseId) {
    // TODO: implement getVerdictTable
  }

  @override
  void ploSuccessRate(String studentId) {
    final String query = '''
            SELECT COUNT(ploNo) AS TotalNoPlotaught
            FROM (
                    SELECT course_id, coNo, ploNo, COUNT(TotalPlo.PLOpercentage) AS Acheive
                    FROM (
                            SELECT co.course_id, co.coNo, p.ploNo, (PLO / TotalComark * 100) AS PLOpercentage
                            FROM mainapp_plo_t p,
                                mainapp_co_t co,
                                (
                                    SELECT en.student_id,
                                            c.course_id,
                                            c.coNo,
                                            c.plo_id,
                                            SUM(DISTINCT e.obtainedMarks) AS PLO,
                                            SUM(DISTINCT a.marks)         AS TotalCoMark
                                    FROM mainapp_enrollment_t en,
                                            mainapp_section_t sec,
                                            mainapp_evaluation_t e,
                                            mainapp_assessment_t a,
                                            mainapp_co_t c,
                                            mainapp_plo_t p
                                    WHERE en.enrollmentID = e.enrollment_id
                                        AND en.section_id = sec.id
                                        AND faculty_id = $studentId
                                        AND e.assessment_id = a.assessmentNo
                                        AND a.co_id = c.id
                                        AND c.plo_id = p.ploNo
                                    GROUP BY student_id, c.course_id, c.coNo, p.ploNo
                                ) ploPer
                            WHERE co.coNo = ploPer.coNo
                                AND p.ploNo = ploPer.plo_id
                                AND co.course_id = ploPer.course_id
                            GROUP BY student_id, co.course_id, co.coNo, ploNo

                        ) TotalPlo

                    GROUP BY course_id, coNo, ploNo
                )
        ''';

    Logger().i(query);
    // TODO: implement ploSuccessRate
  }
}
