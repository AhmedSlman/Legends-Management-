import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/widgets/time_card.dart';

import '../../../../../core/utils/app_styles.dart';
import '../componants/employee_details_header.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: AppStyles.styleBold40(context),
          ),
          const SizedBox(
            height: 20,
          ),
          const EmployeeDetailsHeader(),
          Container(
            padding: EdgeInsets.all(32.h),
            margin: EdgeInsets.all(32.h),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/welcome_Rectangle.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: EmployeCardDetails(),
                ),
                Expanded(
                  flex: 3,
                  child: ScrollableShiftTable(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmployeCardDetails extends StatelessWidget {
  const EmployeCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmployeeDetailsInfo(label: 'Postion', value: 'Seo'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(label: 'Department', value: 'Mid level'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(label: 'Status', value: '794 635 260'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(
            label: 'Postion', value: 'jainpene@gmail.com'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(label: 'Postion', value: '764 212 630 164'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(label: 'Postion', value: '1420'),
        const SizedBox(
          height: 20,
        ),
        const EmployeeDetailsInfo(label: 'Postion', value: 'Complete'),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Monthly Rate',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Row(
              children: List.generate(
                4,
                (index) {
                  return Icon(Icons.star, color: Colors.yellow, size: 14.sp);
                },
              )..add(
                  Icon(Icons.star, color: Colors.grey, size: 14.sp),
                ),
            ),
          ],
        ),
      ],
    );
  }
}

class EmployeeDetailsInfo extends StatelessWidget {
  final String label;
  final String value;

  const EmployeeDetailsInfo(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label : ',
          style: TextStyle(color: Colors.red, fontSize: 14.sp),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}

class ScrollableShiftTable extends StatelessWidget {
  const ScrollableShiftTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable Table with fixed height for seven rows
        Container(
          color: const Color(0xff1A1A1A),
          height: 500.h, // Adjust the height based on your design needs
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical, // Vertical scrolling for extra rows
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1), // Days column (left)
                1: FlexColumnWidth(2), // Day shift column (center)
                2: FlexColumnWidth(2), // Night shift column (right)
              },
              children: [
                // Day rows with dates and TimeCardRow for day and night shifts
                buildShiftRow('Sun \n 10', dayShift: true, nightShift: false),
                buildShiftRow('Mon \n 11', dayShift: true, nightShift: false),
                buildShiftRow('Tue \n 12', dayShift: true, nightShift: false),
                buildShiftRow('Wed \n 13', dayShift: false, nightShift: true),
                buildShiftRow('Thu \n 14', dayShift: false, nightShift: true),
                buildShiftRow('Fri \n 15', dayShift: false, nightShift: true),

                // Add as many rows as you need
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build a shift row
  TableRow buildShiftRow(String day,
      {required bool dayShift, required bool nightShift}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            day,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.h),
          // Conditionally render day shift or an empty container if not available
          child: dayShift
              ? const TimeCardRow()
              : const Center(child: Text('No Day Shift')),
        ),
        Padding(
          padding: EdgeInsets.all(8.h),
          // Conditionally render night shift or an empty container if not available
          child: nightShift
              ? const TimeCardRow()
              : const Center(child: Text('No Night Shift')),
        ),
      ],
    );
  }
}
