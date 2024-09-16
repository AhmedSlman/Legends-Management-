import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/feature/employe/home/presentation/widgets/choose_date_menu_widget.dart';

class MissonsStaticsSection extends StatelessWidget {
  const MissonsStaticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChooseDateMenu(),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMissionCard('Total Missions', '15', '30-9-24'),
            _buildMissionCard('Completed Missions', '10', 'Until Now'),
            _buildMissionCard('Pending Missions', '5', 'Until Now'),
          ],
        ),
      ],
    );
  }

  Widget _buildMissionCard(String title, String value, String subTitle) {
    return Container(
      width: 0.18.sw,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(Icons.circle, color: Colors.orange, size: 10.w),
            ],
          ),
          Text(
            subTitle,
            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
