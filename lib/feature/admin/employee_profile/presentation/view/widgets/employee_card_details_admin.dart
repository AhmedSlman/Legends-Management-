// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../employe/profile/presentation/view/widgets/employee_details_info.dart';
import '../../viewmodel/cubit/admin_employee_data_cubit.dart';

class EmployeeCardDetailsAdmin extends StatelessWidget {
  final String employeeId;
  const EmployeeCardDetailsAdmin({
    super.key,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AdminEmployeeDataCubit()..fetchEmployeeProfileData(employeeId),
      child: BlocBuilder<AdminEmployeeDataCubit, AdminEmployeeDataState>(
        builder: (context, state) {
          if (state is AdminEmployeeDataLoading) {
            return Skeletonizer(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildLoadingSkeletons(),
              ),
            );
          } else if (state is AdminEmployeeDataSuccess) {
            final profile = state.employeeProfile.first;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmployeeDetailsInfo(
                    label: 'Position', value: profile.role ?? 'development'),
                SizedBox(height: 20.h),
                EmployeeDetailsInfo(
                  label: 'Department',
                  value: profile.departmentId.toString(),
                ),
                // SizedBox(height: 20.h),
                // EmployeeDetailsInfo(
                //     label: 'Status', value: state.employeeProfile?.stat),
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
              ],
            );
          } else {
            return const Center(child: Text('Error loading employee details'));
          }
        },
      ),
    );
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
