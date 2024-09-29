import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_images.dart';
import 'package:legends_management/core/utils/app_styles.dart';

import '../../../../../../core/widgets/custom_linear_progress_indicator.dart';
import 'text_info.dart';

class SingleEmployeeCard extends StatelessWidget {
  const SingleEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 415.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 24, 32),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                    Assets.imagesUser,
                  ),
                  radius: 35.r,
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'isabelle june',
                      style: AppStyles.styleSemiBold20(context),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'project Manager',
                      style: AppStyles.styleRegularGrey16(context),
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
                Flexible(
                  flex: 2,
                  child: Text(
                    'Current Task:',
                    style: AppStyles.styleRegular18(context),
                  ),
                ),
                SizedBox(width: 8.h),
                Flexible(
                  flex: 2,
                  child: Text(
                    'In progress',
                    style: AppStyles.styleRegular18(context).copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(width: 8.h),
                // Progress Bar
                const Expanded(
                  flex: 3,
                  child: CustomLinearProgressIndicator(),
                ),
              ],
            ),

            SizedBox(height: 16.h),
            // Monthly Rate
            Row(
              children: [
                const Text(
                  'Monthly Rate:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Wrap(
                  spacing: 4.w,
                  children: List.generate(
                    4,
                    (index) {
                      return Icon(Icons.star, color: Colors.yellow, size: 24.w);
                    },
                  )..add(
                      Icon(Icons.star, color: Colors.grey, size: 24.w),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
