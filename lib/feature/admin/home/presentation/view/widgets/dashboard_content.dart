import 'package:flutter/material.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../tasks/presentation/view/dashboard_tasks_section.dart';
import 'employees_home_section.dart';

class DashBoardContent extends StatelessWidget {
  final VoidCallback onEmployeeTap;

  const DashBoardContent({super.key, required this.onEmployeeTap});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Search and Notification Section
        // const SliverToBoxAdapter(
        //   child: SizedBox(height: 28),
        // ),
        // const SliverToBoxAdapter(
        //   child: SearchAndNotificationSection(),
        // ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 28),
        ),

        // Employees Section (Grid or List view depending on the device size)
        MediaQuery.sizeOf(context).width > SizeConfig.desktop
            ? SliverFillRemaining(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: EmployeesHomeSection(
                        onEmployeeTap: onEmployeeTap,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Expanded(
                      child: DashBoardTasksSection(),
                    ),
                  ],
                ),
              )
            : SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Wrap in SizedBox or ConstrainedBox to provide height
                    SizedBox(
                      height: 300, // Set appropriate height for your content
                      child: EmployeesHomeSection(
                        onEmployeeTap: onEmployeeTap,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 400, // Set appropriate height for your content
                      child: DashBoardTasksSection(),
                    ),
                  ],
                ),
              ),

        // Tasks Section (Can be represented as a SliverList)
      ],
    );
  }
}
