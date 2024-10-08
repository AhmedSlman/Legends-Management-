import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../viewmodel/employee_profile/employee_profile_cubit.dart';
import 'employee_details_info.dart';

class EmployeeCardDetails extends StatelessWidget {
  const EmployeeCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeProfileCubit()..fetchEmployeeProfileData(),
      child: BlocBuilder<EmployeeProfileCubit, EmployeeProfileState>(
        builder: (context, state) {
          if (state is EmployeeProfileLoading) {
            return Skeletonizer(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildLoadingSkeletons(),
              ),
            );
          } else if (state is EmployeeProfileSuccess) {
            final profile = state.employeeProfile.first;

            // Safely parse the rating string to a double, defaulting to 0.0 if it's invalid
            double rating = 0.0;
            if (profile.rating != null && profile.rating!.isNotEmpty) {
              try {
                rating = double.parse(profile.rating!);
              } catch (e) {
                print("Error parsing rating: $e");
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmployeeDetailsInfo(
                    label: 'Position', value: profile.role ?? 'development'),
                SizedBox(height: 20.h),
                EmployeeDetailsInfo(
                  label: 'Department',
                  value: getDepartmentName(profile.departmentId),
                ),
                SizedBox(height: 20.h),
                EmployeeDetailsInfo(label: 'Email', value: profile.email ?? ''),
                SizedBox(height: 20.h),
                EmployeeDetailsInfo(label: 'Phone', value: profile.phone ?? ''),
                SizedBox(height: 20.h),
                EmployeeDetailsInfo(
                  label: 'Bank Account',
                  value: profile.bankAccount.toString(),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      'Rating:',
                      style: AppStyles.styleRegular14(context).copyWith(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    RatingBarIndicator(
                      unratedColor: Colors.white,
                      rating: rating,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 24.w,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppStyles.styleRegular14(context),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            );
          } else {
            return const Center(child: Text('Error loading employee details'));
          }
        },
      ),
    );
  }

  // Method to get the department name based on the department ID
  String getDepartmentName(int? departmentId) {
    switch (departmentId) {
      case 1:
        return 'Marketing';
      case 2:
        return 'Sales';
      case 3:
        return 'Design';
      case 4:
        return 'Development';
      case 5:
        return 'Human Resources';
      case 6:
        return 'Accounting and Finance';
      default:
        return 'Unknown Department';
    }
  }

  List<Widget> _buildLoadingSkeletons() {
    return List.generate(7, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom skeleton container
          Container(
            width: 200.w, // Adjust as necessary
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.grey[700], // Skeleton color
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      );
    });
  }
}
