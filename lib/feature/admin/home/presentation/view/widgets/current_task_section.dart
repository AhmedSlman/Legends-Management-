// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:legends_management/feature/employe/home/presentation/viewmodel/emloyeehometaskcubit/employee_home_tasks_cubit.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../tasks/presentation/view/widgets/task_card.dart';

class CurrentTasksSection extends StatelessWidget {
  const CurrentTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            'Current Tasks',
            style: AppStyles.styleRegular18(context),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: BlocProvider(
                create: (context) =>
                    EmployeeHomeTasksCubit()..fetchAllEmployeesTasks(),
                child:
                    BlocBuilder<EmployeeHomeTasksCubit, EmployeeHomeTasksState>(
                  builder: (context, state) {
                    if (state is EmployeeHomeTasksSuccess) {
                      // Check if the task data is null or empty
                      if (state.employeeTasks?.data == null ||
                          state.employeeTasks!.data!.isEmpty) {
                        return Center(
                          child: Text(
                            'There are no tasks',
                            style: AppStyles.styleRegular14(context),
                          ),
                        );
                      }

                      // If there are tasks, display them
                      return ListView.builder(
                        itemCount: state.employeeTasks!.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.h),
                            child: TaskCard(
                              taskName: 'Task${index + 1}',
                              taskDetails: state.employeeTasks!.data![index]
                                      .description ??
                                  '',
                              status:
                                  state.employeeTasks!.data![index].status ??
                                      'pending',
                              value: state.employeeTasks!.data![index].status ==
                                      'completed'
                                  ? 1
                                  : 0.2,
                              canUpdate: false,
                            ),
                          );
                        },
                      );
                    } else if (state is EmployeeHomeTasksLoading) {
                      return ListView.builder(
                        itemCount:
                            5, // Define how many skeleton items you want to show
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.h),
                            child: const Skeletonizer(
                              enabled:
                                  true, // When true, it displays the skeleton version
                              child: TaskCard(
                                taskName: '',
                                taskDetails: '',
                                status: '',
                                value: 0.0,
                                canUpdate: false,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'There is no tasks',
                          style: AppStyles.styleRegular14(context),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
