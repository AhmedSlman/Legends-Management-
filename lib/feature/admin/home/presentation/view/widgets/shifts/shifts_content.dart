import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../search_notification_section.dart';
import 'shifts_table.dart';

class ShiftsContent extends StatelessWidget {
  const ShiftsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchAndNotificationSection(),
        const SizedBox(height: 20),
        Text(
          'Shifts',
          style: AppStyles.styleBold40(context),
        ),
        const SizedBox(height: 20),
        const Expanded(
          child: ShiftsTable(),
        ),
      ],
    );
  }
}
