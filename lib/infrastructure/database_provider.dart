import 'dart:io';
// import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:iub_student_monitoring_system/domain/plo/plo.dart';
import 'package:iub_student_monitoring_system/domain/user/user.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

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
  Database? newDb;

  List<Plo> ploList = [];

  User? user;
  UserType? userType;

  Future<void> loadDatabase(String dbName, String newDbName) async {
    if (Platform.isAndroid) {
      final String databasepath = await getDatabasesPath();
      final String path = join(databasepath, dbName);
      final String newPath = join(databasepath, newDbName);

      final bool dbExists = await databaseExists(path);
      final bool newDbExists = await databaseExists(newPath);

      Logger().i('Database existance: $dbExists');
      Logger().i('newDatabase existance: $newDbExists');

      if (!dbExists) {
        await Directory(dirname(path)).create(recursive: true);

        // copy from assets
        final ByteData data =
            await rootBundle.load(join('assets/database', dbName));
        final List<int> bytes =
            data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

        //write
        await File(path).writeAsBytes(bytes, flush: true);
      }
      if (!newDbExists) {
        await Directory(dirname(newPath)).create(recursive: true);

        // copy from assets
        final ByteData data =
            await rootBundle.load(join('assets/database', newDbName));
        final List<int> bytes =
            data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

        //write
        await File(newPath).writeAsBytes(bytes, flush: true);
      }

      database = await openDatabase(path);
      newDb = await openDatabase(newPath);
      Logger().i('database opened');
    } else if (Platform.isLinux) {
      sqfliteFfiInit();
      final Directory appDocDir = await getApplicationDocumentsDirectory();

      final String appDocPath = join(appDocDir.path, newDbName);
      Logger().i(appDocPath);

      final DatabaseFactory databaseFactory = databaseFactoryFfi;
      database = await databaseFactory.openDatabase(appDocPath);
    }
  }

  factory DBProvider.instance() => _db;
}
