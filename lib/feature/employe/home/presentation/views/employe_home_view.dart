import 'package:flutter/material.dart';
import 'package:legends_management/feature/employe/home/presentation/views/widgets/employee_custom_drawer.dart';
import 'package:legends_management/feature/employe/profile/presentation/view/employee_profile_screen.dart';

import '../../../../../core/utils/size_config.dart';
import 'widgets/employee_dashboard_view.dart';

class EmployeHomeScreen extends StatefulWidget {
  const EmployeHomeScreen({super.key});

  @override
  State<EmployeHomeScreen> createState() => _EmployeHomeScreenState();
}

class _EmployeHomeScreenState extends State<EmployeHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late TabController _tabController;

  final List<Widget> _tabsContent = [
    const EmployeeDashBoardView(),
    const EmployeeProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabsContent.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.desktop
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
            )
          : null,
      drawer: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? EmployeeCustomDrawer(
              tabController: _tabController,
              // scaffoldState: scaffoldKey.currentState!,
            )
          : null,
      backgroundColor: Colors.black,
      body: Row(
        children: [
          MediaQuery.sizeOf(context).width < SizeConfig.desktop
              ? Container()
              : Expanded(
                  flex: 1,
                  child: EmployeeCustomDrawer(
                    tabController: _tabController,
                    // scaffoldState: scaffoldKey.currentState!,
                  ),
                ),
          const SizedBox(width: 32),

          Expanded(
            flex: 5,
            child: TabBarView(
              controller: _tabController,
              children: _tabsContent,
            ),
          ),

          // Main Content Area
        ],
      ),
    );
  }
}
