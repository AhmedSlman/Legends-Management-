import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import 'package:legends_management/core/widgets/shimmer.dart';
import 'package:legends_management/feature/employe/home/presentation/viewmodel/emloyeehometaskcubit/employee_home_tasks_cubit.dart';

class CurrentMissionSection extends StatelessWidget {
  const CurrentMissionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: BlocProvider(
        create: (context) => EmployeeHomeTasksCubit()..fetchAllEmployeesTasks(),
        child: BlocBuilder<EmployeeHomeTasksCubit, EmployeeHomeTasksState>(
          builder: (context, state) {
            if (state is EmployeeHomeTasksLoading) {
              return const ShimmerTaskCard();
            } else if (state is EmployeeHomeTasksSuccess) {
              final currentTask = state.employeeTasks?.data?.isNotEmpty ?? false
                  ? state.employeeTasks?.data!.first
                  : null;

              // Check if there's a current task
              if (currentTask == null) {
                return Text(
                  'No current mission available',
                  style: AppStyles.styleRegular16(context),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Mission',
                        style: AppStyles.styleRegular18(context),
                      ),
                      // Text(
                      //   'Deadline: 25-8',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 14.sp,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Details:',
                    style: AppStyles.styleRegular14(context),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    currentTask.description ?? 'lorem',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              );
            } else {
              return const Text('failure');
            }
          },
        ),
      ),
    );
  }
}
