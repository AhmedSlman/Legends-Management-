
import 'package:flutter/material.dart';

import '../../../../admin/home/presentation/view/widgets/current_task_section.dart';
import '../../../../admin/home/presentation/view/widgets/search_notification_section.dart';
import 'employee_home_dashbord_section.dart';

class EmployeeDashBoardView extends StatelessWidget {
  const EmployeeDashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SearchAndNotificationSection(),
                    SizedBox(height: 28),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: EmployeeHomeDashbordSection(),
                          ),
                          Expanded(
                            child: CurrentTasksSection(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    // CurrentTasksSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
        // SizedBox(width: 320),
      ],
    );
  }
}