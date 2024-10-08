import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legends_management/core/constants/constants.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_styles.dart';

class EmployeeDetailsHeader extends StatelessWidget {
  const EmployeeDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          child: SvgPicture.asset(
            Assets.imagesUsersvg,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          employeeName,
          style: AppStyles.styleRegular16(context),
        ),
        // const Spacer(),
        // SvgPicture.asset(Assets.imagesProfileedit),
      ],
    );
  }
}
