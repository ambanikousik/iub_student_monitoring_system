import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';

class BarChart extends StatelessWidget {
  final String title;
  final Map<String, double> data;
  const BarChart(
    this.data,
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        children: [
          CustomText(
            title,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            textType: TextType.headLine5,
          ),
          SizedBox(
            height: 300.h,
            child: Echarts(
              option: jsonEncode({
                'tooltip': {
                  'trigger': 'axis',
                  'axisPointer': {'type': 'shadow'}
                },
                'grid': {
                  'left': '3%',
                  'right': '4%',
                  'bottom': '3%',
                  'containLabel': true
                },
                'xAxis': {'type': 'category', 'data': data.keys.toList()},
                'yAxis': {'type': 'value'},
                'series': [
                  {'name': 'score', 'data': data.values.toList(), 'type': 'bar'}
                ]
              }),
            ),
          ),
        ],
      ),
    );
  }
}
