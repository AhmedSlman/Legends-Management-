import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_employee_header.dart';

class EmployeesHomeSection extends StatelessWidget {
  const EmployeesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddEmployeeHeader(),
        Expanded(child: EmployeesGridView()),
      ],
    );
  }
}

class EmployeesGridView extends StatelessWidget {
  const EmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const SingleEmployeeCard();
        },
      ),
    );
  }
}

class SingleEmployeeCard extends StatelessWidget {
  const SingleEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 26, 24, 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage("assets/images/logo.png"),
                  radius: 35.r,
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'isabelle june',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'project Manager',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const TextInfo(label: 'Department', value: 'Design'),
            const TextInfo(label: 'Hired Date', value: '9 / 2 / 21'),
            const TextInfo(label: 'Email', value: 'isabellejune@gmail.com'),
            const TextInfo(label: 'Phone', value: '97632622203'),
            const TextInfo(label: 'Bank Account', value: '976 326 222 203'),
            const TextInfo(label: 'Status', value: 'junior'),
            SizedBox(height: 16.h),
            // Task Progress Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Task',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                Text(
                  'In progress',
                  style: TextStyle(color: Colors.orange, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LinearProgressIndicator(
                value: 0.2,
                backgroundColor: Colors.white,
                color: Colors.green,
                minHeight: 10.h,
              ),
            ),
            SizedBox(height: 16.h),
            // Monthly Rate
            Row(
              children: [
                Text(
                  'Monthly Rate',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                const Spacer(),
                Row(
                  children: List.generate(4, (index) {
                    return Icon(Icons.star, color: Colors.yellow, size: 20.sp);
                  })
                    ..add(Icon(Icons.star, color: Colors.grey, size: 20.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextInfo extends StatelessWidget {
  final String label;
  final String value;

  const TextInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text(
            '$label : ',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          SizedBox(width: 8.w),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
