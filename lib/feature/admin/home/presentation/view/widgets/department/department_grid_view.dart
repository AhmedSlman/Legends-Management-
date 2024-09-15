import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../../../../../core/utils/app_images.dart';
import 'single_department_card.dart';

class DepartmentsGridView extends StatelessWidget {
  final ValueChanged<int> onDepartmentSelected;

  const DepartmentsGridView({
    super.key,
    required this.onDepartmentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [.5.fr, .5.fr, .5.fr],
      rowSizes: const [auto, auto],
      columnGap: 16,
      rowGap: 16,
      children: [
        SingleDepartmentCard(
          departmentImage: Assets.imagesMarketing,
          departmentName: 'Marketing',
          onTap: () => onDepartmentSelected(0),
        ),
        SingleDepartmentCard(
          departmentImage: Assets.imagesSales,
          departmentName: 'Sales',
          onTap: () => onDepartmentSelected(1),
        ),
        SingleDepartmentCard(
          departmentImage: Assets.imagesDesign,
          departmentName: 'Design',
          onTap: () => onDepartmentSelected(2),
        ),
        SingleDepartmentCard(
          departmentImage: Assets.imagesDepartments,
          departmentName: 'Development',
          onTap: () => onDepartmentSelected(3),
        ),
        SingleDepartmentCard(
          departmentImage: Assets.imagesHumanresources,
          departmentName: 'Human Resources',
          onTap: () => onDepartmentSelected(4),
        ),
        SingleDepartmentCard(
          departmentImage: Assets.imagesMarketing,
          departmentName: 'Accounting & Finance',
          onTap: () => onDepartmentSelected(5),
        ),
      ],
    );
  }
}
