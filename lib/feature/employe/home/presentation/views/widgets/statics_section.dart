// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';

import '../../viewmodel/cubit/home_tasks_count_cubit.dart';

class MissonsStaticsSection extends StatelessWidget {
  const MissonsStaticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTasksCountCubit()..retriveTasksCount(),
      child: BlocBuilder<HomeTasksCountCubit, HomeTasksCountState>(
        builder: (context, state) {
          if (state is HomeTasksCountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeTasksCountSuccess) {
            final homeTasksCount = state.homeTasksCount;

            // Calculate the filled percentage based on completed tasks
            double filledPercentage = 0;
            if (homeTasksCount?.allTasks != 0) {
              filledPercentage = (homeTasksCount?.completedTasks ?? 0) /
                  (homeTasksCount?.allTasks ?? 1) *
                  100;
            }

            return Container(
              color: const Color(0xff101013),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MissionCard(
                          title: 'Total Missions',
                          value: '${homeTasksCount?.allTasks}',
                          subTitle: '30-9-24',
                          filledPercentage:
                              filledPercentage, // Pass filled percentage here
                        ),
                        MissionCard(
                          title: 'Completed Missions',
                          value: '${homeTasksCount?.completedTasks}',
                          subTitle: 'Until Now',
                          filledPercentage:
                              filledPercentage, // Pass filled percentage here
                        ),
                        MissionCard(
                          title: 'Pending Missions',
                          value: '${homeTasksCount?.pendingTasks}',
                          subTitle: 'Until Now',
                          filledPercentage:
                              filledPercentage, // Pass filled percentage here
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is HomeTasksCountFailure) {
            return Center(
              child: Text(
                'Error: ${state.errMsg}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return const Center(child: Text('No Data Available'));
          }
        },
      ),
    );
  }
}

class MissionCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final double filledPercentage; // Add filledPercentage here

  const MissionCard({
    super.key,
    required this.title,
    required this.value,
    required this.subTitle,
    required this.filledPercentage, // Initialize filledPercentage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.18.sw,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.styleRegular14(context).copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  value,
                  style: AppStyles.styleRegular24(context).copyWith(
                    color: Colors.orange,
                  ),
                ),
                Text(
                  subTitle,
                  style: AppStyles.styleRegular14(context).copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Conditionally render the pie chart
          if (title == 'Completed Missions' && filledPercentage >= 0)
            SizedBox(
              width: 55,
              height: 55,
              child: EmployeeMissionsPerformancePieChart(
                filledPercentage: filledPercentage,
              ),
            ),
        ],
      ),
    );
  }
}

class EmployeeMissionsPerformancePieChart extends StatelessWidget {
  final double filledPercentage;

  const EmployeeMissionsPerformancePieChart({
    super.key,
    required this.filledPercentage, // Accept filledPercentage
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 30.r,
            startDegreeOffset: -90,
            sections: [
              PieChartSectionData(
                value: 100 - filledPercentage,
                color: const Color(0xff75757566).withOpacity(.4),
                radius: 12.r,
                title: '',
                showTitle: false,
              ),
              PieChartSectionData(
                value: filledPercentage,
                color: const Color(0xff033B47),
                radius: 12.r,
                title: '',
                showTitle: false,
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            '${filledPercentage.toInt()}%',
            style: AppStyles.styleRegular14(context),
          ),
        ),
      ],
    );
  }
}
