import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:iub_student_monitoring_system/application/auth/auth_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          EasyLoading.showError(state.error);
        } else if (state.loading) {
          EasyLoading.show(status: 'loading...');
        }
      },
      child: Scaffold(
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
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
