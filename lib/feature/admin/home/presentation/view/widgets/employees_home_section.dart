import 'package:flutter/material.dart';

import 'add_employee_header.dart';

class EmployeesHomeSection extends StatelessWidget {
  const EmployeesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddEmployeeHeader(),
        EmployeesGridView(),
      ],
    );
  }
}


class EmployeesGridView extends StatelessWidget {
  const EmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class SingleEmployeeCard extends StatelessWidget {
  const SingleEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
