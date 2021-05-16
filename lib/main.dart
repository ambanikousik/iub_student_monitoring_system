import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/application/auth/auth_bloc.dart';
import 'package:iub_student_monitoring_system/infrastructure/auth_provider.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';
import 'package:iub_student_monitoring_system/presentation/pages/login/login_page.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DBProvider databaseProvider = DBProvider.instance();
  await databaseProvider.loadDatabase('db.sqlite3');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthProvider()),
        child: ScreenUtilInit(
          designSize: const Size(490.9, 1036.4),
          builder: () => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginPage(),
            builder: EasyLoading.init(),
          ),
        ));
  }
}
