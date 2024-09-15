import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_button.dart';

class AddEmployeeHeader extends StatelessWidget {
  const AddEmployeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '27',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
              TextSpan(
                text: 'Employee',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          width: 79,
          buttonText: 'Add',
          onPressed: () {},
        ),
      ],
    );
  }
}
