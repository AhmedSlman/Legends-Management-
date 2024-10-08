import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class ChooseDateMenu extends StatelessWidget {
  const ChooseDateMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButton<String>(
            value: 'Monthly',
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            dropdownColor: Colors.grey[900],
            underline: Container(),
            items: ['Monthly', 'Weekly', 'Yearly'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
        Text(
          '20-9-2024',
          style: AppStyles.styleRegular14(context),
        ),
      ],
    );
  }
}
