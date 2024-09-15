import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 13,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: LinearProgressIndicator(
          value: 0.2,
          backgroundColor: Colors.white,
          color: Colors.green,
          minHeight: 10.h,
        ),
      ),
    );
  }
}
