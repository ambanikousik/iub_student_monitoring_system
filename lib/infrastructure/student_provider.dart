import 'package:iub_student_monitoring_system/domain/course_wise_plo/course_wise_plo.dart';
import 'package:iub_student_monitoring_system/domain/i_student_provider.dart';
import 'package:iub_student_monitoring_system/domain/plo/plo.dart';
import 'package:iub_student_monitoring_system/domain/semester_wise_progress/semester_wise_progress.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';

class StudentProvider extends IStudentProvider {
  final DBProvider db = DBProvider.instance();

  @override
  Future<Plo> getLowestPLO() async {
    double lowestRate = 0;
    Plo lowestPlo = db.ploList.first;
    for (final Plo plo in db.ploList) {
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
                        WHERE en.student_id = ${db.user!.userName}
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = "${plo.plo}"
                        GROUP BY en.section_id
                    ) ploPer
                ) TotalPlo;
            ''';
      final List<Map<String, Object?>> queryResult =
          await db.database!.rawQuery(query);
      final double currentRate = queryResult[0]['ActualPlo']! as double;

      if (lowestRate == 0 || lowestRate > currentRate) {
        lowestRate = currentRate;
        lowestPlo = plo;
      }
    }

    return lowestPlo;
  }

  @override
  Future<int> getNoOfPLOAttempted() async {
    final String query = '''
            SELECT COUNT(TotalPlo.PLOpercentage) AS Acheive
            FROM (
                    SELECT   student_id,(PLO / TotalComark * 100) AS PLOpercentage
                    FROM mainapp_plo_t p,
                        mainapp_co_t co,
                        (
                            SELECT en.student_id,c.plo_id,SUM(DISTINCT e.obtainedMarks) AS PLO,SUM(DISTINCT a.marks)AS TotalCoMark
                            FROM mainapp_enrollment_t en,
                                mainapp_evaluation_t e,
                                mainapp_assessment_t a,
                                mainapp_co_t c,
                                mainapp_plo_t p,
                                mainapp_section_t sec
                            WHERE en.student_id = ${db.user!.userName}
                            AND en.enrollmentID = e.enrollment_id
                                AND e.assessment_id = a.assessmentNo
                                AND a.co_id = c.id
                                AND c.plo_id = p.ploNo
                            GROUP BY  student_id,p.ploNo
                        ) ploPer
                    WHERE p.ploNo = ploPer.plo_id

                GROUP BY student_id,ploNo
            
                ) TotalPlo
        ''';

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query);

    return queryResult[0]['Acheive']! as int;
  }

  @override
  Future<int> getNumberOfPLOAchieved() async {
    final String query = '''
            SELECT COUNT(TotalPlo.PLOpercentage) AS Acheive
            FROM (
                    SELECT   student_id,(PLO / TotalComark * 100) AS PLOpercentage
                    FROM mainapp_plo_t p,
                        mainapp_co_t co,
                        (
                            SELECT en.student_id,c.plo_id,SUM(DISTINCT e.obtainedMarks) AS PLO,SUM(DISTINCT a.marks)AS TotalCoMark
                            FROM mainapp_enrollment_t en,
                                mainapp_evaluation_t e,
                                mainapp_assessment_t a,
                                mainapp_co_t c,
                                mainapp_plo_t p,
                                mainapp_section_t sec
                            WHERE en.student_id = ${db.user!.userName}
                            AND en.enrollmentID = e.enrollment_id
                                AND e.assessment_id = a.assessmentNo
                                AND a.co_id = c.id
                                AND c.plo_id = p.ploNo
                            GROUP BY  student_id,p.ploNo
                        ) ploPer
                    WHERE p.ploNo = ploPer.plo_id

                GROUP BY student_id,ploNo
                HAVING PLOpercentage >=40
                ) TotalPlo

            GROUP BY student_id
        ''';

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query);
    return queryResult[0]['Acheive']! as int;
  }

  @override
  double getPLOSuccessRate(int achieved, int attempted) {
    final double x = achieved / attempted * 100;
    final String s = x.toStringAsFixed(1);
    return double.parse(s);
  }

  @override
  Future<List<CourseWisePloData>> getCourseWisePLO() async {
    final List<CourseWisePloData> dataList = [];
    final List<String> courses = [];

    final String query = '''
            SELECT DISTINCT co.course_id, co.coNo, p.ploNo, (PLO / TotalComark * 100) AS PLOpercentage
                FROM mainapp_plo_t p, mainapp_co_t co, (
                    SELECT DISTINCT c.course_id,c.coNo, c.plo_id, SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                    FROM mainapp_enrollment_t en,
                        mainapp_evaluation_t e,
                        mainapp_assessment_t a,
                        mainapp_co_t c,
                        mainapp_plo_t p
                    WHERE en.student_id = ${db.user!.userName}
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

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query);

    for (final Map<String, Object?> query in queryResult) {
      final String course = query['course_id']! as String;
      if (!courses.contains(course)) {
        courses.add(course);
      }
    }

    for (final String course in courses) {
      final List<CourseWisePloScoreData> data =
          List<CourseWisePloScoreData>.from(
              db.ploList.map((e) => CourseWisePloScoreData(e.plo, 0)));
      dataList.add(CourseWisePloData(course, data));
    }

    for (final Map<String, Object?> query in queryResult) {
      final String ploNo = query['ploNo']! as String;
      final String course = query['course_id']! as String;
      final double percentage =
          double.parse((query['PLOpercentage']! as double).toStringAsFixed(2));

      for (CourseWisePloData data in dataList) {
        if (data.course == course) {
          final List<CourseWisePloScoreData> courseDataList =
              data.courseDataList;
          final int index =
              courseDataList.indexWhere((plo) => plo.plo == ploNo);
          if (index != -1) {
            courseDataList[index] = CourseWisePloScoreData(ploNo, percentage);
            data = data.copyWith(courseDataList: courseDataList);
          }
        }
      }
    }
    return dataList;
    // TODO: implement getCourseWisePLO
  }

  @override
  Future<Map<String, double>> getDepartmentWisePLO() async {
    final Map<String, double> resultMAp = {};
    String query(String plo, String dept) => '''
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
                            WHERE st.department_id = "$dept"
                            AND st.studentID = en.student_id
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = "$plo"
                            GROUP BY en.section_id
                        ) ploPer
                    ) TotalPlo;
            ''';

    final String department = await getStdDepartmentId();
    for (final Plo plo in db.ploList) {
      final List<Map<String, Object?>> queryResult =
          await db.database!.rawQuery(query(plo.plo, department));
      // Logger().i(queryResult);
      final double rate = queryResult.first['ActualPlo']! as double;

      resultMAp[plo.plo] = double.parse(rate.toStringAsFixed(2));
    }
    return resultMAp;
  }

  @override
  Future<List<SemesterWiseProgress>> getStudentProgressView(String year) async {
    final List<SemesterWiseProgress> progressData = [];
    String actualQuery(int semester, String plo) => '''
                    SELECT COUNT(Acheived.ActualPlo) AS PLoacheivedornot
                    FROM(
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
                                WHERE en.student_id = ${db.user!.userName}
                                    AND en.semester = $semester
                                    AND en.year = $year
                                    AND en.enrollmentID = e.enrollment_id
                                    AND e.assessment_id = a.assessmentNo
                                    AND a.co_id = c.id
                                    AND c.plo_id = "$plo"
                                GROUP BY en.semester
                            ) ploPer
                        ) TotalPlo
                    ) Acheived
                    WHERE Acheived.ActualPlo >=40;
                '''; //.format(student_id, i + 1, year, j))

    String expectedQuery(int semester, String plo) => '''
                    SELECT COUNT(Acheived.ActualPlo) AS PLoacheivedornot
                    FROM(
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
                                WHERE en.student_id = ${db.user!.userName}
                                    AND en.semester = $semester
                                    AND en.year = $year
                                    AND en.enrollmentID = e.enrollment_id
                                    AND e.assessment_id = a.assessmentNo
                                    AND a.co_id = c.id
                                    AND c.plo_id = "$plo"
                                GROUP BY en.semester
                            ) ploPer
                        ) TotalPlo
                    ) Acheived
                ''';

    for (int semester = 1; semester <= 3; semester++) {
      int actual = 0;
      int expected = 0;
      for (final Plo plo in db.ploList) {
        final List<Map<String, Object?>> actualQueryResult =
            await db.database!.rawQuery(actualQuery(semester, plo.plo));
        final List<Map<String, Object?>> expectedQueryResult =
            await db.database!.rawQuery(expectedQuery(semester, plo.plo));
        if (actualQueryResult.first['PLoacheivedornot']! as int > 0) {
          actual = actual + 1;
        }
        if (expectedQueryResult.first['PLoacheivedornot']! as int > 0) {
          expected = expected + 1;
        }
      }

      final String semesterName = await getSemesterName(semester);
      progressData.add(SemesterWiseProgress(semesterName, expected, actual));
    }

    return progressData;
  }

  @override
  Future<Map<String, double>> studentWisePLO() async {
    final Map<String, double> resultMAp = {};
    String query(String ploId) => '''
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
                        WHERE en.student_id = ${db.user!.userName}
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = "$ploId"
                        GROUP BY en.section_id
                    ) ploPer
                ) TotalPlo;
            ''';
    for (final Plo plo in db.ploList) {
      final List<Map<String, Object?>> queryResult =
          await db.database!.rawQuery(query(plo.plo));

      final double rate = queryResult.first['ActualPlo']! as double;

      resultMAp[plo.plo] = double.parse(rate.toStringAsFixed(2));
    }
    return resultMAp;
  }

  @override
  Future<String> getStdDepartmentId() async {
    String query(String studentId) => '''SELECT department_id
                                      FROM mainapp_student_t
                                    WHERE studentID = $studentId;''';

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query(db.user!.userName));
    return queryResult.first['department_id']! as String;
  }

  @override
  Future<String> getSemesterName(int id) async {
    final String query = '''SELECT name
                            FROM mainapp_semester_t
                            WHERE id = $id;''';

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query);

    return queryResult.first['name']! as String;
  }

  @override
  Future<List<String>> getYears() async {
    final List<String> years = [];
    final String query = '''SELECT year
                        FROM mainapp_enrollment_t
                        WHERE student_id = ${db.user!.userName};''';

    final List<Map<String, Object?>> queryResult =
        await db.database!.rawQuery(query);

    for (final Map<String, Object?> result in queryResult) {
      final String year = result['year']! as String;
      if (!years.contains(year)) {
        years.add(year);
      }
    }
    return years;
  }
}
