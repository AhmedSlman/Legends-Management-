import 'package:flutter/material.dart';
import 'package:legends_management/feature/admin/department/presentation/view/fiance_department_content.dart';
import 'package:legends_management/feature/admin/department/presentation/view/hr_department_content.dart';
import 'package:legends_management/feature/admin/department/presentation/view/marketing_department_content.dart';
import 'package:legends_management/feature/admin/department/presentation/view/sales_department_content.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../department_grid_view.dart';
import '../design_department_content.dart';
import '../development_department_content.dart';

class DepartmentsContent extends StatefulWidget {
  const DepartmentsContent({super.key});

  @override
  State<DepartmentsContent> createState() => _DepartmentsContentState();
}

class _DepartmentsContentState extends State<DepartmentsContent> {
  int _selectedDepartmentIndex = -1;

  final List<Widget> _departmentContents = [
    const MarketingDepartmentContent(),
    const SalesDepartmentContent(),
    const DesignDepartmentContent(),
    const DevelopmentDepartmentContent(),
    const HrDepartmentContent(),
    const FianceDepartmentContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SearchAndNotificationSection(),
          // const SizedBox(height: 20),
          if (_selectedDepartmentIndex == -1)
            Text(
              'Departments',
              style: AppStyles.styleBold40(context),
            ),
          const SizedBox(height: 10),
          _selectedDepartmentIndex == -1
              ? SizedBox(
                  height: 400,
                  child: DepartmentsGridView(
                    onDepartmentSelected: (index) {
                      setState(() {
                        _selectedDepartmentIndex = index;
                      });
                    },
                  ),
                )
              : Expanded(
                  child: _departmentContents[_selectedDepartmentIndex],
                ),
          if (_selectedDepartmentIndex != -1)
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedDepartmentIndex = -1;
                  });
                },
                child: const Text('Back to Departments'),
              ),
            ),
        ],
      ),
    );
  }
}
