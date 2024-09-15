import 'package:flutter/material.dart';
import 'package:legends_management/feature/admin/home/presentation/view/widgets/current_task_section.dart';

import 'widgets/custom_drawer.dart';
import 'widgets/employees_home_section.dart';
import 'widgets/search_notification_section.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // Custom Drawer (Sidebar)
          Expanded(
            flex: 1,
            child: CustomDrawer(),
          ),
          SizedBox(width: 32),

          // Main Content Area
          Expanded(
            flex: 3,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchAndNotificationSection(),
                      SizedBox(height: 28),
                      Expanded(
                        flex: 2,
                        child: EmployeesHomeSection(),
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
          Expanded(
            child: CurrentTasksSection(),
          ),
        ],
      ),
    );
  }
}
