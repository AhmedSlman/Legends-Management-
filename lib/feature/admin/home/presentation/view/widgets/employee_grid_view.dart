import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'single_employee_card.dart';

class EmployeesGridView extends StatelessWidget {
  final VoidCallback onEmployeeTap;
  const EmployeesGridView({super.key, required this.onEmployeeTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              MediaQuery.sizeOf(context).width > SizeConfig.tablet ? 1 : .51,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onEmployeeTap,
            child: const SingleEmployeeCard(),
          );
        },
      ),
    );
  }
}
