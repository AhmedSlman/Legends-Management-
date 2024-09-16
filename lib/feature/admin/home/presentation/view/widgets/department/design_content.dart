import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/utils/size_config.dart';
import 'department_employee_card.dart';

class DesignContent extends StatelessWidget {
  const DesignContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Design',
          style: AppStyles.styleBold40(context),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.sizeOf(context).width > SizeConfig.desktop
                      ? 2
                      : 1, // Two cards per row
              crossAxisSpacing: 10, // Horizontal space between cards
              mainAxisSpacing: 20, // Vertical space between cards
              childAspectRatio:
                  MediaQuery.sizeOf(context).width > SizeConfig.desktop
                      ? 7
                      : 4.5, // Adjust this value to maintain fixed height
            ),
            itemCount: 6, // Total number of items (example)
            itemBuilder: (context, index) {
              return const DepartmentEmployeeCard();
            },
          ),
        ),
      ],
    );
  }
}
