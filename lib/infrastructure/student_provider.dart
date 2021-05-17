import 'package:iub_student_monitoring_system/domain/i_student_provider.dart';
import 'package:iub_student_monitoring_system/domain/plo/plo.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';
import 'package:logger/logger.dart';

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
  Future<void> getCourseWisePLO() async {
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
  Future<void> getStudentProgressView() async {
    // TODO: implement getStudentProgressView
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
    Logger().i(queryResult);
    return queryResult.first['department_id']! as String;
  }
}
