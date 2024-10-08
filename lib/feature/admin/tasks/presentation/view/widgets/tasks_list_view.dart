import 'package:flutter/material.dart';
import 'package:legends_management/feature/admin/home/data/models/tasks_model.dart';

import 'task_card.dart';

class TasksListView extends StatelessWidget {
  final List<TasksData> tasksData;
  const TasksListView({super.key, required this.tasksData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff101013),
      child: ListView.builder(
        itemCount: tasksData.length,
        itemBuilder: (context, index) {
          return TaskCard(
            canUpdate: true,
            taskName: 'Task ${index + 1}',
            taskDetails: tasksData[index].description ??
                'Simply Dummy text of the printing',
            status: tasksData[index].status,
            value: tasksData[index].status == 'pending' ? .4 : 1,
            taskId: tasksData[index].id.toString(),
            // taskId: tasksData[index].id.toString(),
            // teamImages: List.generate(
            //   4,
            //   (index) => Assets.imagesUser,
            // ),
          );
        },
      ),
    );
  }
}
