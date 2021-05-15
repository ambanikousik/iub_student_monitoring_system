import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final Color fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color borderColor;
  final TextType? textType;
  final EdgeInsets? padding;
  final bool isPassword;
  final bool enabled;
  const CustomTextField(this.controller, this.hint,
      {this.label,
      this.hintColor,
      this.isPassword = false,
      this.textColor,
      this.fillColor = Colors.transparent,
      this.padding,
      this.borderColor = Colors.blue,
      this.textType,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextFormField(
        enabled: enabled,
        validator: _validator,
        showCursor: true,
        cursorColor: Theme.of(context).colorScheme.primaryVariant,
        obscureText: isPassword,
        style: (textType ?? TextType.headLine5)
            .toStyle(context: context)
            .copyWith(
                color: textColor ?? Theme.of(context).colorScheme.secondary),
        controller: controller,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          isDense: true,
          prefixStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: ScreenUtil().setSp(25)),
          hintText: hint,
          labelText: label ?? hint,
          errorMaxLines: 2,
          labelStyle: TextType.body2.toStyle(context: context).copyWith(
              color: hintColor ?? Theme.of(context).colorScheme.secondary),
          hintStyle: (textType ?? TextType.headLine5)
              .toStyle(context: context)
              .copyWith(
                  color: hintColor ??
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  String? _validator(String? text) {
    if (text == null || text.isEmpty) {
      return 'field cannot be empty';
    } else {
      return null;
    }
  }
}
