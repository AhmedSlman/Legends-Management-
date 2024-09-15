import 'package:flutter/material.dart';

import 'add_employee_header.dart';
import 'employee_grid_view.dart';

class EmployeesHomeSection extends StatelessWidget {
  const EmployeesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        AddEmployeeHeader(),
        Expanded(
          child: EmployeesGridView(),
        ),
      ],
    );
  }
}






