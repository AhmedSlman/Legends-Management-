import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';

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
          style: AppStyles.styleRegular18(context),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            value,
            style: AppStyles.styleRegular18(context).copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
