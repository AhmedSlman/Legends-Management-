import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';
import 'widgets/employee_card_details.dart';
import 'widgets/employee_details_header.dart';
import 'widgets/scrollable_shift_table.dart';
import '../../../../../../core/utils/size_config.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

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
              child: MediaQuery.sizeOf(context).width > SizeConfig.desktop
                  ? const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: EmployeeCardDetails(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: ScrollableShiftTable(),
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        EmployeeCardDetails(),
                        SizedBox(height: 10), // Add spacing between widgets
                        ScrollableShiftTable(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
