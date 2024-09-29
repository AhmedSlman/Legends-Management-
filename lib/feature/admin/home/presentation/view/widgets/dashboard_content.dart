import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'dashboard_tasks_section.dart';
import 'employees_home_section.dart';
import 'search_notification_section.dart';

class DashBoardContent extends StatelessWidget {
  final VoidCallback onEmployeeTap;

  const DashBoardContent({super.key, required this.onEmployeeTap});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              // Search and Notification Section at the top
              const SearchAndNotificationSection(),
              const SizedBox(height: 28),

              // Row containing EmployeesHomeSection and HomeTasksSection
              MediaQuery.sizeOf(context).width > SizeConfig.desktop
                  ? Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // EmployeesHomeSection
                          Expanded(
                            flex: 2,
                            child: EmployeesHomeSection(
                              onEmployeeTap: onEmployeeTap,
                            ),
                          ),
                          const SizedBox(width: 30),

                          // HomeTasksSection
                          const Expanded(
                            child: DashBoardTasksSection(),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // EmployeesHomeSection
                          Expanded(
                            flex: 2,
                            child: EmployeesHomeSection(
                              onEmployeeTap: onEmployeeTap,
                            ),
                          ),
                          const SizedBox(width: 30),

                          // HomeTasksSection
                          const Expanded(
                            child: DashBoardTasksSection(),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
