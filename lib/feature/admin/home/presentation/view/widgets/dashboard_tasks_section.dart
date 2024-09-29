import 'package:flutter/material.dart';

import 'current_tasks_header.dart';
import 'tasks_list_view.dart';

class DashBoardTasksSection extends StatelessWidget {
  const DashBoardTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 8.0,
      ),
      child: Column(
        children: [
          CurrentTasksHeader(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TasksListView(),
          ),
        ],
      ),
    );
  }
}
