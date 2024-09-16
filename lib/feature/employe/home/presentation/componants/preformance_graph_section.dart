import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceGraphSection extends StatelessWidget {
  const PerformanceGraphSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Performance Per Month',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          // Placeholder for bar chart
          Container(
            height: 200.h,
            width: double.infinity,
            color: Colors.grey[800],
            child: Center(
              child: Text(
                'Bar Chart Here',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
