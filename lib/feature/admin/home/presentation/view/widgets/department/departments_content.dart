import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../search_notification_section.dart';
import 'department_grid_view.dart';
import 'design_content.dart';

class DepartmentsContent extends StatefulWidget {
  const DepartmentsContent({super.key});

  @override
  State<DepartmentsContent> createState() => _DepartmentsContentState();
}

class _DepartmentsContentState extends State<DepartmentsContent> {
  int _selectedDepartmentIndex = -1; // No department selected initially


  final List<Widget> _departmentContents = [
    const Center(child: Text('Marketing Content')),
    const Center(child: Text('Sales Content')),
    const DesignContent(),
    const Center(child: Text('Development Content')),
    const Center(child: Text('HR Content')),
    const Center(child: Text('Finance Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchAndNotificationSection(),
          const SizedBox(height: 20),
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
                    _selectedDepartmentIndex = -1; // Reset to show grid
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
