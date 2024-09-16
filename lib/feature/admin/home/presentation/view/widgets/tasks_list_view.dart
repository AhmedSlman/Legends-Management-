import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_images.dart';

import 'single_task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return SingleTaskCard(
          index: index,
          taskDetails: 'Simply dummy text of the printing.',
          status: index % 2 == 0 ? 'In progress' : 'Pending',
          progress: index % 2 == 0 ? 0.6 : 0.3,
          teamImages: List.generate(
            4,
            (index) => Assets.imagesLogo,
          ),
        );
      },
    );
  }
}
