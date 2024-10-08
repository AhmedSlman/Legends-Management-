import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/feature/admin/tasks/presentation/viewmodel/taskscubit/tasks_cubit.dart';
import 'package:legends_management/feature/admin/tasks/presentation/viewmodel/updatetask/update_task_cubit.dart';

import '../../../../../core/widgets/shimmer.dart';
import '../../../home/presentation/viewmodel/allemployeescubit/all_employees_cubit.dart';
import '../viewmodel/createtaskcubit/create_task_cubit.dart';
import 'widgets/current_tasks_header.dart';
import 'widgets/tasks_list_view.dart';

class DashBoardTasksSection extends StatelessWidget {
  const DashBoardTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AllEmployeesCubit>(
            create: (context) => AllEmployeesCubit()..fetchAllEmployees(),
          ),
          BlocProvider<TasksCubit>(
            create: (context) => TasksCubit()..getAllTasks(),
          ),
          // Provide CreateTaskCubit here
          BlocProvider<CreateTaskCubit>(
            create: (context) => CreateTaskCubit(),
          ),
          BlocProvider<UpdateTaskCubit>(
            create: (context) => UpdateTaskCubit(),
          ),
        ],
        child: Column(
          children: [
            const CurrentTasksHeader(),
            const SizedBox(height: 10),
            Expanded(
              child: BlocListener<UpdateTaskCubit, UpdateTaskState>(
                listener: (context, state) {
                  if (state is UpdateTaskSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Task status updated successfully!')),
                    );
                  } else if (state is UpdateTaskFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to update task: ${state.errMsg}')),
                    );
                  }
                },
                child: BlocBuilder<TasksCubit, TasksState>(
                  builder: (context, state) {
                    if (state is TasksLoading) {
                      return const ShimmerTaskCard();
                    } else if (state is TasksSuccess) {
                      return TasksListView(
                        tasksData: state.tasksModel,
                      );
                    } else {
                      return Container(); // Handle errors or empty states
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
