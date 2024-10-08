import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class WelcomSection extends StatelessWidget {
  const WelcomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Good Morning ,',
                  style: AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: employeeName,
                  style: AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.orange),
                ),
              ],
            ),
          ),
          // const TimeCardRow(),
        ],
      ),
    );
  }
}
