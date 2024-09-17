// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:legends_management/feature/employe/home/presentation/widgets/choose_date_menu_widget.dart';

class MissonsStaticsSection extends StatelessWidget {
  const MissonsStaticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff101013),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const ChooseDateMenu(),
            SizedBox(height: 24.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MissionCard(
                  title: 'Total Missions',
                  value: '15',
                  subTitle: '30-9-24',
                ),
                MissionCard(
                  title: 'Completed Missions',
                  value: '10',
                  subTitle: 'Until Now',
                ),
                MissionCard(
                  title: 'Pending Missions',
                  value: '5',
                  subTitle: 'Until Now',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MissionCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;

  const MissionCard({
    super.key,
    required this.title,
    required this.value,
    required this.subTitle,
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
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 55,
            height: 55,
            child: EmployeeMissionsPerformancePieChart(),
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
    this.filledPercentage = 75, // Default to 75%
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0, // Space between sections
            centerSpaceRadius: 30.r, // Adjusted to create an empty center
            startDegreeOffset: -90, // Start the chart from the top
            sections: [
              PieChartSectionData(
                value: 100 - filledPercentage, // Empty section first
                color: const Color(0xff75757566)
                    .withOpacity(.4), // Light color for empty section
                radius: 12.r, // Adjusted radius
                title: '',
                showTitle: false,
              ),
              PieChartSectionData(
                value: filledPercentage, // Filled section second
                color: const Color(0xff033B47),
                radius: 12.r, // Adjusted radius
                title: '',
                showTitle: false,
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            '${filledPercentage.toInt()}%',
            style: const TextStyle(
              fontSize: 12, // Adjust font size if necessary
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
