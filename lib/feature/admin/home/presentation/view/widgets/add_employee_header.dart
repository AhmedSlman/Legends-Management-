import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_styles.dart';

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
                style: AppStyles.styleRegular32(context),
              ),
              TextSpan(
                text: 'Employee',
                style: AppStyles.styleRegularRed32(context),
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
