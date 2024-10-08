// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:legends_management/core/utils/app_images.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/feature/admin/department/data/department_model.dart';

class DepartmentEmployeeCard extends StatelessWidget {
  const DepartmentEmployeeCard({
    super.key,
    required this.employees,
  });
  final Employees employees;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff151515),
      child: ListTile(
        leading: CircleAvatar(
          child: SvgPicture.asset(
            Assets.imagesUsersvg,
          ),
        ),
        title: Text(
          employees.name ?? 'sophia',
          style: AppStyles.styleSemiBold20(context).copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        subtitle: Text(
          employees.phone.toString(),
          style: AppStyles.styleRegular24(context).copyWith(
            color: const Color(0xff535353),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color(0xffFF4811),
          ),
        ),
      ),
    );
  }
}
