import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/feature/employe/home/presentation/componants/current_mession_section.dart';
import 'package:legends_management/feature/employe/home/presentation/componants/preformance_graph_section.dart';
import 'package:legends_management/feature/employe/home/presentation/componants/statics_section.dart';
import 'package:legends_management/feature/employe/home/presentation/componants/welcom_section.dart';

class EmployeeHomeDashbordSection extends StatelessWidget {
  const EmployeeHomeDashbordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
    );
  }
}
