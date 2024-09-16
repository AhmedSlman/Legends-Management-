// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/utils/app_styles.dart';

class SingleDepartmentCard extends StatelessWidget {
  final String departmentImage;
  final String departmentName;
 
  final VoidCallback onTap;
  const SingleDepartmentCard({
    super.key,
    required this.departmentImage,
    required this.departmentName,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 150,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const Border(
            top: BorderSide.none,
            left: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            right: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
        ),
        child: FittedBox(
          child: Column(
            children: [
              SvgPicture.asset(
                departmentImage,
                width: 55.w,
                height: 55.h,
              ),
              const SizedBox(height: 15),
              Text(
                departmentName,
                style: AppStyles.styleRegular16(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
