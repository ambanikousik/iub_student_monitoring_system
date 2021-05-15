import 'package:dartz/dartz.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';
import 'package:logger/logger.dart';

import 'failure/failure.dart';
import 'user/user.dart';

class AuthProvider {
  Future<Either<Failure, Unit>> login(String user, String password) async {
    try {
      final db = DBProvider.instance();
      final List<
          Map<String,
              Object?>> userResponse = await db.database!.rawQuery(
          "SELECT * FROM auth_user WHERE username = '$user' and password = '$password'");
      final List<Map<String, Object?>> res = await db.database!.rawQuery(
          "SELECT * FROM auth_user WHERE username = '$user' and password = '$password'");
      db.user = User.fromJson(userResponse[0]);
      Logger().i(db.user);
      return right(unit);
    } catch (e) {
      return left(const Failure('Invalid credential'));
    }
  }
}
