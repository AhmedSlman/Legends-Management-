import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/feature/employe/home/presentation/views/widgets/current_mession_section.dart';
import 'package:legends_management/feature/employe/home/presentation/views/widgets/preformance_graph_section.dart';
import 'package:legends_management/feature/employe/home/presentation/views/widgets/statics_section.dart';
import 'package:legends_management/feature/employe/home/presentation/views/widgets/welcom_section.dart';

class EmployeeHomeDashbordSection extends StatelessWidget {
  const EmployeeHomeDashbordSection({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEE, d-M-yyyy');
    final dateString = formatter.format(now);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateString,
            style: AppStyles.styleRegular16(context),
          ),
          SizedBox(height: 16.h),
          const WelcomSection(),
          SizedBox(height: 16.h),
          const MissonsStaticsSection(),
          SizedBox(height: 16.h),
          const CurrentMissionSection(),
          SizedBox(height: 16.h),
          const PerformanceGraphSection(),
        ],
      ),
    );
  }
}
