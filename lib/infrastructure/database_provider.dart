import 'dart:io';

import 'package:flutter/services.dart';
import 'package:iub_student_monitoring_system/domain/user/user.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';

enum UserType { student, faculty, management }

extension UserTypeExt on UserType {
  String toUpperCase() {
    switch (this) {
      case UserType.student:
        return 'STUDENT';

      case UserType.faculty:
        return 'FACULTY';

      case UserType.management:
        return 'HIGHER MANAGEMENT';
    }
  }
}

class DBProvider {
  DBProvider._();
  static final DBProvider _db = DBProvider._();

  Database? database;

  User? user;
  UserType? userType;

  Future<void> loadDatabase(String dbName) async {
    final String databasepath = await getDatabasesPath();
    final String path = join(databasepath, dbName);

    final bool dbExists = await databaseExists(path);
    Logger().i('Database existance: $dbExists');

    if (!dbExists) {
      await Directory(dirname(path)).create(recursive: true);

      // copy from assets
      final ByteData data = await rootBundle.load(join('assets', dbName));
      final List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      //write
      await File(path).writeAsBytes(bytes, flush: true);
    }
    database = await openDatabase(path);
    Logger().i('database opened');
  }

  factory DBProvider.instance() => _db;
}
