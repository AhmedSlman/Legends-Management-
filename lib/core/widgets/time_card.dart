import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey[700],
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' $period',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
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
  const TimeCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TimeCard(
          title: 'Begin',
          time: '8:00',
          period: 'AM',
          topColor: Color(0xFF00695C),
        ),
        SizedBox(width: 16.w),
        const TimeCard(
          title: 'End',
          time: '3:00',
          period: 'PM',
          topColor: Color(0xFF004D60),
        ),
      ],
    );
  }
}
