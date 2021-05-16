import 'package:dartz/dartz.dart';
import 'package:iub_student_monitoring_system/domain/plo/plo.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';
import 'package:logger/logger.dart';

import '../domain/failure/failure.dart';
import '../domain/user/user.dart';

class AuthProvider {
  Future<Either<Failure, Unit>> login(String user, String password) async {
    try {
      final db = DBProvider.instance();
      final List<
          Map<String,
              Object?>> userResponse = await db.database!.rawQuery(
          "SELECT * FROM auth_user WHERE username = '$user' and password = '$password'");
      db.user = User.fromJson(userResponse[0]);
      Logger().i(db.user);
// get user type
      final List<Map<String, Object?>> res =
          await db.database!.rawQuery("""SELECT type.name FROM auth_group type,
                                      auth_user_groups  auth
                                    WHERE  auth.user_id = ${db.user!.id}
                                  AND auth.group_id = type.id;""");

      final String rawType = res[0]['name']! as String;

      final UserType type = UserType.values
          .firstWhere((type) => type.toUpperCase() == rawType.toUpperCase());

      db.userType = type;
// get plo list
      final List<Map<String, Object?>> queryResult =
          await db.database!.rawQuery("SELECT * FROM mainapp_plo_t");

      final List<Plo> _ploList =
          List<Plo>.from(queryResult.map((e) => Plo.fromJson(e)));

      db.ploList = _ploList;
      return right(unit);
    } catch (e) {
      Logger().i(e);
      return left(const Failure('Invalid credential'));
    }
  }
}
