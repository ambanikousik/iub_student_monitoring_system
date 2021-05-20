import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iub_student_monitoring_system/application/student/student_bloc.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/bar_chart.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/course_wise_plo_chart.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/custom_text.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/info_grid_tile.dart';
import 'package:iub_student_monitoring_system/presentation/Widgets/semester_wise_progress_chart.dart';

class StudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final StudentBloc studentBloc = BlocProvider.of<StudentBloc>(context);
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Image.asset(
                  'assets/iub_logo.png',
                  height: 50.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const CustomText(
                  'Student Performance\nMonitor',
                  textType: TextType.headLine5,
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png'))),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          CustomText(
                            "${state.user.firstName} ${state.user.lastName}",
                            textType: TextType.headLine4,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            "ID: ${state.user.userName}",
                            textType: TextType.headLine5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Divider(
                      thickness: 2,
                      height: 10.h,
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      InfoGridTile(
                        title: 'PLO Achieved',
                        color: Colors.blueAccent,
                        value: state.ploAchieved.toString(),
                      ),
                      InfoGridTile(
                        title: 'PLO Attempted',
                        color: Colors.redAccent,
                        value: state.ploAttempted.toString(),
                      ),
                      InfoGridTile(
                        title: 'Lowest PLO',
                        color: Colors.green,
                        value: state.lowestPlo,
                      ),
                      InfoGridTile(
                        title: 'Success Rate',
                        color: Colors.orange,
                        value: "${state.successRate} %",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  BarChart(state.studentPlo, 'Student-wise PLO'),
                  BarChart(state.deptPlo, 'Deartment-wise PLO'),
                  SemesterWiseProgressChart(
                      state.semesterWiseProgress, state.years),
                  CourseWisePloChart(state.courseWisePloList)
                ],
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     studentBloc.add(const LoadStudentData());
          //   },
          //   backgroundColor: Colors.redAccent,
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.logout),
          // ),
        );
      },
    );
  }
}
