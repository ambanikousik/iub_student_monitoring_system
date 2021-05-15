import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color color;
  final EdgeInsets? margin;
  final Color textColor;
  final TextType textType;
  final EdgeInsets? padding;

  const AppButton(
      {Key? key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.blue,
      this.textColor = Colors.white,
      this.margin,
      this.textType = TextType.headLine6,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 10.h,
              ),
          elevation: 0,
          primary: color,
          onPrimary: Colors.white,
          side: BorderSide(
            width: 0,
            color: color,
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text!,
                  color: textColor, maxLine: 1, textType: textType),
            ],
          ),
        ),
      ),
    );
  }
}
