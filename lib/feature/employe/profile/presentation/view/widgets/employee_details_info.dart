import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class EmployeeDetailsInfo extends StatelessWidget {
  final String label;
  final String value;

  const EmployeeDetailsInfo(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label : ',
          style: AppStyles.styleRegular14(context).copyWith(
            color: Colors.red,
          ),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            value,
            style: AppStyles.styleRegular14(context),
          ),
        ),
      ],
    );
  }
}
