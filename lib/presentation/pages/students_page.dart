import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iub_student_monitoring_system/application/auth/auth_bloc.dart';
import 'package:iub_student_monitoring_system/application/student/student_bloc.dart';

class StudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  'counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              const userName = '1810281';
              const password = '579243';
              BlocProvider.of<AuthBloc>(context)
                  .add(const Login(userName, password));
            },
            backgroundColor: Colors.redAccent,
            tooltip: 'Increment',
            child: const Icon(Icons.logout),
          ),
        );
      },
    );
  }
}
