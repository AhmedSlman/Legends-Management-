import 'package:flutter/material.dart';

import 'current_tasks_header.dart';
import 'tasks_list_view.dart';

class DashBoardTasksSection extends StatelessWidget {
  const DashBoardTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CurrentTasksHeader(),
        Expanded(
          child: TasksListView(),
        ),
      ],
    );
  }
}