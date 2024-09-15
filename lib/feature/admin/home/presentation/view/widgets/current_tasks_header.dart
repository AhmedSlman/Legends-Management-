import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_styles.dart';

class CurrentTasksHeader extends StatelessWidget {
  const CurrentTasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Current Tasks',
          style: AppStyles.styleSemiBold20(context),
        ),
        GestureDetector(
          onTap: () {
            // to be implemented
          },
          child: SvgPicture.asset(Assets.imagesAddbutton),
        ),
      ],
    );
  }
}