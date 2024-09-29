import 'package:flutter/material.dart';

import 'add_employee_header.dart';
import 'employee_grid_view.dart';

class EmployeesHomeSection extends StatelessWidget {
  final VoidCallback onEmployeeTap;
  const EmployeesHomeSection({super.key, required this.onEmployeeTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: AddEmployeeHeader(),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: EmployeesGridView(
            onEmployeeTap: onEmployeeTap,
          ),
        ),
      ],
    );
  }
}
