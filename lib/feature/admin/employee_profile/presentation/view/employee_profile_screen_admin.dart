// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_styles.dart';
import 'widgets/employee_card_details_admin.dart';
import 'widgets/employee_details_header_admin.dart';
import 'widgets/scrollable_shifts_admin.dart';

class EmployeeProfileScreenAdmin extends StatelessWidget {
  final String employeeId;

  const EmployeeProfileScreenAdmin({
    super.key,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const EmployeeDetailsHeaderAdmin(),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: EmployeeCardDetailsAdmin(
                      employeeId: employeeId,
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: ScrollableShiftTableAdmin(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
