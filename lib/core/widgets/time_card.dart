import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class TimeCard extends StatelessWidget {
  final String title;
  final String time;
  final String period;
  final Color topColor;

  const TimeCard({
    super.key,
    required this.title,
    required this.time,
    required this.period,
    required this.topColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      // height: 49.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
        ),
        color: Color(0xff333333),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: topColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular14(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: time,
                    style: AppStyles.styleRegular14(context),
                  ),
                  TextSpan(
                    text: ' $period',
                    style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeCardRow extends StatelessWidget {
  final String startTime;
  final String startPeriod;
  final String endTime;
  final String endPeriod;

  const TimeCardRow({
    super.key,
    required this.startTime,
    required this.startPeriod,
    required this.endTime,
    required this.endPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          // width: 80.w,
          child: TimeCard(
            title: 'Begin',
            time: startTime,
            period: startPeriod,
            topColor: const Color(0xFF00695C),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          // width: 80.w,
          child: TimeCard(
            title: 'End',
            time: endTime,
            period: endPeriod,
            topColor: const Color(0xFF004D60),
          ),
        ),
      ],
    );
  }
}
