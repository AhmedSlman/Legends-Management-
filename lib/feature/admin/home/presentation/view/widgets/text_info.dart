import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInfo extends StatelessWidget {
  final String label;
  final String value;

  const TextInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label : ',
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
