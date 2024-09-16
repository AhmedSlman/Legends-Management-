import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'single_employee_card.dart';

class EmployeesGridView extends StatelessWidget {
  const EmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.sizeOf(context).width > SizeConfig.desktop ? 2 : 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              MediaQuery.sizeOf(context).width > SizeConfig.desktop ? 1.2 : 3,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const SingleEmployeeCard();
        },
      ),
    );
  }
}
