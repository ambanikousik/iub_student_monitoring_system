import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/domain/course_wise_plo/course_wise_plo.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';

class CourseWisePloChart extends StatelessWidget {
  final List<CourseWisePloData> data;

  const CourseWisePloChart(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      final List<String> ploList =
          List<String>.from(data.first.courseDataList.map((e) => e.plo));
      final List<String> courseList =
          List<String>.from(data.map((e) => e.course));
      final List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(data.map((e) {
        final List<double> scores = List<double>.from(
            e.courseDataList.map((value) => value.percentage));
        return {
          'name': e.course,
          'type': 'bar',
          'stack': 'total',
          'label': {'show': false},
          'emphasis': {'focus': 'series'},
          'data': scores
        };
      }));

      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Column(
          children: [
            const CustomText(
              'Student Progress View (Semester-wise)',
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              textType: TextType.headLine5,
            ),

            // if (dataList.isNotEmpty)
            SizedBox(
              height: 300.h,
              child: Echarts(
                option: jsonEncode({
                  'tooltip': {
                    'trigger': 'axis',
                    'axisPointer': {
                      // Use axis to trigger tooltip
                      'type':
                          'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
                    }
                  },
                  'legend': {'data': courseList},
                  'grid': {
                    'left': '3%',
                    'right': '4%',
                    'bottom': '3%',
                    'containLabel': true
                  },
                  'yAxis': {'type': 'value'},
                  'xAxis': {'type': 'category', 'data': ploList},
                  'series': dataList
                }),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: const CustomText(
          'Course-wise PLO chart',
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          textType: TextType.headLine5,
        ),
      );
    }
  }
}
