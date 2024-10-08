import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
    this.value = .4,
  });
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      height: 13.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.white,
          color: const Color(0xff006654),
          minHeight: 10.h,
        ),
      ),
    );
  }
}
