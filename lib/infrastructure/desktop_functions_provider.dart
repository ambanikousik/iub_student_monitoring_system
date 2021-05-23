import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:iub_student_monitoring_system/resources/excel_files.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqlite_api.dart';

class DesktopFunctionsProvider {
  final Database database;
  DesktopFunctionsProvider._(this.database);
  factory DesktopFunctionsProvider.instance(Database database) =>
      DesktopFunctionsProvider._(database);

  Excel? excel;
  Future<List<dynamic>> loadData() async {
    const String query = '''SELECT * FROM auth_user''';
    final List<dynamic> res = await database.rawQuery(query);
    Logger().i(res);
    return res;
  }

  Future<Excel> loadExcelFile(String filename) async {
    final ByteData data = await rootBundle.load(filename);
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final Excel _excel = Excel.decodeBytes(bytes);
    Logger().i('excel file loaded');
    return _excel;
  }

  Future<int> getCombinationId(String exam, String question) async {
    final String query = '''SELECT a.id
                  FROM co_combination a,exams b, questions c
                  WHERE  a.exm_id = b.id  
                  AND b.name = "$exam"
                  AND a.qst_id = c.id
                  AND c.name = "$question";''';

    final List<Map<String, Object?>> result = await database.rawQuery(query);
    return result.first['id']! as int;
  }

  Future<int> getStudentId(String stdId) async {
    final String query = '''SELECT id
                        FROM students
                        WHERE students.student_id  = $stdId;
                        ''';
    final List<Map<String, Object?>> result = await database.rawQuery(query);
    return result.first['id']! as int;
  }

  Future<int> getCourseId(String course) async {
    final String query = '''SELECT id
                        FROM courses
                        WHERE courses.name  = "$course";
                        ''';

    final List<Map<String, Object?>> result = await database.rawQuery(query);
    return result.first['id']! as int;
  }

  Future<int> getSemesterId(String semester) async {
    final String query = '''SELECT id
                        FROM semesters
                        WHERE semesters.name  = "$semester";
                        ''';
    final List<Map<String, Object?>> result = await database.rawQuery(query);
    return result.first['id']! as int;
  }

// cse101 , cse 104 , 201,203, 204,210, 213, 216, 303,307,309,211, 214
  Future<void> loadStudentsMarks() async {
    final Excel excel = await loadExcelFile(ExcelFiles.cse214ObeMarkSheet);
    final Sheet sheet = excel.tables['Marks']!;
    // final int combID = await getCombinationId('Final', 'Q1');

    // load midterm Marks
    for (int i = 5; i < 11; i++) {
      final String exmName = sheet.rows[0][5]!.value.toString();
      final String qstName = sheet.rows[2][i]!.value.toString();
      for (int r = 4; r < sheet.maxRows; r++) {
        final String stdId = sheet.rows[r][1]!.value.toString();
        final String semester = sheet.rows[r][4]!.value.toString();
        final String course = sheet.rows[r][2]!.value.toString();
        final int section = int.parse(sheet.rows[r][3]!.value.toString());
        final int marks = int.parse(sheet.rows[r][i]!.value.toString());
        final int combID =
            await getCombinationId(exmName.replaceAll(' ', ''), qstName);
        final int studentID = await getStudentId(stdId);
        final int semesterID = await getSemesterId(semester);
        final int courseID = await getCourseId(course);

        final String query =
            '''INSERT INTO students_marks (student_id,semester_id ,course_id,section,co_combination_id,mark)
                                VALUES($studentID,$semesterID,$courseID,$section,$combID,$marks);''';
        await database.rawQuery(query);
        Logger()
            .i('$stdId $course $section $semester $exmName $qstName $marks');
      }
    }

    // load final marks
    for (int i = 13; i < 17; i++) {
      final String exmName = sheet.rows[0][13]!.value.toString();
      final String qstName = sheet.rows[2][i]!.value.toString();
      for (int r = 4; r < sheet.maxRows; r++) {
        final String stdId = sheet.rows[r][1]!.value.toString();
        final String semester = sheet.rows[r][4]!.value.toString();
        final String course = sheet.rows[r][2]!.value.toString();
        final int section = int.parse(sheet.rows[r][3]!.value.toString());
        final int marks = sheet.rows[r][i] != null
            ? int.parse(sheet.rows[r][i]!.value.toString())
            : 0;
        Logger()
            .i('$stdId $course $section $semester $exmName $qstName $marks');
        final int combID =
            await getCombinationId(exmName.replaceAll(' ', ''), qstName);
        final int studentID = await getStudentId(stdId);
        final int semesterID = await getSemesterId(semester);
        final int courseID = await getCourseId(course);
        final String query =
            '''INSERT INTO students_marks (student_id,semester_id ,course_id,section,co_combination_id,mark)
                                VALUES($studentID,$semesterID,$courseID,$section,$combID,$marks);''';
        await database.rawQuery(query);
      }
    }

    // load project work
    for (int r = 4; r < sheet.maxRows; r++) {
      final String exmName = sheet.rows[0][19]!.value.toString();
      final String qstName = sheet.rows[2][19]!.value.toString();
      final String stdId = sheet.rows[r][1]!.value.toString();
      final String semester = sheet.rows[r][4]!.value.toString();
      final String course = sheet.rows[r][2]!.value.toString();
      final int section = int.parse(sheet.rows[r][3]!.value.toString());
      final int marks = sheet.rows[r][19] != null
          ? int.parse(sheet.rows[r][19]!.value.toString())
          : 0;
      Logger().i('$stdId $course $section $semester $exmName $qstName $marks');
      final int combID = await getCombinationId(exmName, qstName);
      final int studentID = await getStudentId(stdId);
      final int semesterID = await getSemesterId(semester);
      final int courseID = await getCourseId(course);
      final String query =
          '''INSERT INTO students_marks (student_id,semester_id ,course_id,section,co_combination_id,mark)
                                VALUES($studentID,$semesterID,$courseID,$section,$combID,$marks);''';
      await database.rawQuery(query);
    }
  }

  Future<List<dynamic>> testData() async {
    const String query = '''SELECT *
                  FROM students_marks;
                        ''';
    final List<dynamic> result = await database.rawQuery(query);
    // Logger().i(result);
    return result;
  }
}
