// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/custom_linear_progress_indicator.dart';
import 'text_info.dart';

class SingleTaskCard extends StatelessWidget {
  final int index;

  final String taskDetails;
  final String status;
  // final double progress;
  // final List<String> teamImages;
  final double value;
  const SingleTaskCard({
    super.key,
    required this.index,
    required this.taskDetails,
    required this.status,
    // required this.progress,
    // required this.teamImages,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task ${index + 1}',
          style: AppStyles.styleRegular16(context),
        ),
        Card(
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
                SizedBox(height: 16.h),
                TextInfo(
                  label: 'Details:',
                  value: taskDetails,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'Status:',
                      style: AppStyles.styleRegular18(context),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // Progress Bar
                    CustomLinearProgressIndicator(
                      value: value,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      status,
                      style: AppStyles.styleRegular18(context).copyWith(
                        color: status == 'pending' ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Row(
                //   children: [
                //     Text(
                //       'Team:',
                //       style: AppStyles.styleRegular18(context),
                //     ),
                //     SizedBox(width: 8.w),
                //     // ...teamImages.map(
                //     //   (image) {
                //     //     return Padding(
                //     //       padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                //     //       child: CircleAvatar(
                //     //         backgroundImage: AssetImage(image),
                //     //         radius: 15.r,
                //     //       ),
                //     //     );
                //     //   },
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
