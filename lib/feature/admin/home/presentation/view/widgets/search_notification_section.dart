import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SearchAndNotificationSection extends StatelessWidget {
  const SearchAndNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: CustomTextField(
            hint: 'Search',
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.imagesNotification,
          ),
        ),
        CircleAvatar(
          child: SvgPicture.asset(
            Assets.imagesUser,
          ),
        ),
      ],
    );
  }
}
