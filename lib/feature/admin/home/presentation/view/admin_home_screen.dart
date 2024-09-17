// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import 'widgets/admin_custom_drawer.dart';
import 'widgets/dashboard_content.dart';
import 'widgets/department/departments_content.dart';
import 'widgets/shifts/shifts_content.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late TabController _tabController;

  final List<Widget> _tabsContent = [
    const DashBoardContent(),
    const DepartmentsContent(),
    const ShiftsContent(),
    const Center(child: Text('Teams')),
    const Center(child: Text('All tasks')),
    const Center(child: Text('All Projects')),
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
          ? AdminCustomDrawer(
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
                  flex: 2,
                  child: AdminCustomDrawer(
                    tabController: _tabController,
                    // scaffoldState: scaffoldKey.currentState!,
                  ),
                ),
          const SizedBox(width: 10),
          Expanded(
            flex: 10,
            child: TabBarView(
              controller: _tabController,
              children: _tabsContent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
