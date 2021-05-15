import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/application/auth/auth_bloc.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/app_button.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_textfield.dart';
import 'package:iub_student_monitoring_system/presentation/pages/home_page.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _username =
        useTextEditingController(text: '1810281');

    final TextEditingController _password =
        useTextEditingController(text: '579243');

    final _formKey = useMemoized(() => GlobalKey<FormState>());
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          EasyLoading.showError(state.error);
        } else if (state.isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset('assets/iub_logo.png'),
              Center(
                child: CustomText(
                  'Welcome to SPM',
                  color: Colors.black,
                  textType: TextType.headLine3,
                  padding: EdgeInsets.symmetric(vertical: 50.h),
                ),
              ),
              CustomTextField(_username, 'user name'),
              CustomTextField(_password, 'password'),
              AppButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(Login(_username.text, _password.text));
                    }
                  })
            ],
          ),
        )),
      ),
    );
  }
}
