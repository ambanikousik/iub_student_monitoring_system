import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/application/student/student_bloc.dart';
import 'package:iub_student_monitoring_system/domain/semester_wise_progress/semester_wise_progress.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_dropdown.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';

class SemesterWiseProgressChart extends StatelessWidget {
  final List<String> years;
  final List<SemesterWiseProgress> dataList;

  const SemesterWiseProgressChart(
    this.dataList,
    this.years, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentBloc studentBloc = BlocProvider.of<StudentBloc>(context);
    final List<String> semsters = dataList.map((e) => e.semester).toList();
    final List<int> actual = dataList.map((e) => e.actual).toList();
    final List<int> expected = dataList.map((e) => e.expected).toList();

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
          CustomDropDown('Select year', years, (year) {
            studentBloc.add(LoadSemesterWiseProgressData(year));
          }),
          if (dataList.isNotEmpty)
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
                  'xAxis': {
                    'type': 'category',
                    'data': semsters,
                    'boundaryGap': false,
                  },
                  'yAxis': {'type': 'value'},
                  'series': [
                    {
                      'name': 'actual',
                      'data': actual,
                      'type': 'line',
                      'smooth': true,
                      'lineStyle': {'width': 0},
                      'areaStyle': {'color': 'rgba(0, 221, 255)'},
                      'emphasis': {'focus': 'series'},
                    },
                    {
                      'name': 'expected',
                      'data': expected,
                      'type': 'line',
                      'smooth': true,
                      'lineStyle': {'width': 0},
                      'areaStyle': {'color': 'rgba(255, 191, 255)'},
                      'emphasis': {'focus': 'series'},
                    }
                  ]
                }),
              ),
            ),
        ],
      ),
    );
  }
}
