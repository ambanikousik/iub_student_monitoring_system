import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iub_student_monitoring_system/infrastructure/database_provider.dart';
import 'package:iub_student_monitoring_system/infrastructure/desktop_functions_provider.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';
import 'package:json_table/json_table.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final DesktopFunctionsProvider desktop =
      DesktopFunctionsProvider.instance(DBProvider.instance().database!);

  List<dynamic> data = [];

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Desktop handler'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              CustomText(
                data.length.toString(),
                maxLine: 200,
                textType: TextType.headLine1,
                padding: const EdgeInsets.all(20),
              ),
            ],
          ),
          // if (data.isNotEmpty)
          //   Expanded(
          //       child: SingleChildScrollView(
          //           child: Center(child: JsonTable(data)))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final List _data = await desktop.loadData();
          // text = await desktop.excelFunc();
          await desktop.loadStudentsMarks();
          data = await desktop.testData();
          setState(() {});
        },
        tooltip: 'Action',
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
