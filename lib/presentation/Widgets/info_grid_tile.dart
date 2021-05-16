import 'package:flutter/material.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';

class InfoGridTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const InfoGridTile(
      {Key? key,
      this.title = 'Title',
      this.value = 'Value',
      this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: color,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title,
            textType: TextType.headLine6,
            color: color,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            value,
            // fontWeight: FontWeight.bold,
            textType: TextType.headLine6,
            align: TextAlign.center,
            color: color,
          )
        ],
      ),
    );
  }
}
