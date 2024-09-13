import 'package:flutter/material.dart';

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
          Expanded(
            flex: 1,
            child: CustomDrawer(),
          ),
          SizedBox(
            width: 32,
          ),
          Expanded(
            flex: 3,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    children: [
                      SearchAndNotificationSection(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(top: 28),
                              child: EmployeesHomeSection(),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          // Expanded(
                          //   child: Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 40,
                          //       ),
                          //       MyCardsAndTranstionHistorySection(),
                          //       SizedBox(
                          //         height: 24,
                          //       ),
                          //       Expanded(
                          //         child: IncomeSection(),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




