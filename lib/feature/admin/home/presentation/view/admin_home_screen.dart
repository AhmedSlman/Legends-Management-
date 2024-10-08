// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/feature/admin/home/presentation/viewmodel/logoutcubit/logout_cubit.dart';
import 'package:legends_management/feature/employe/profile/presentation/view/employee_profile_screen.dart';

import '../../../../../core/utils/size_config.dart';
import 'widgets/admin_custom_drawer.dart';
import 'widgets/dashboard_content.dart';
import '../../../department/presentation/view/widgets/departments_content.dart';
import '../../../shifts/presentation/view/shifts_content.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late TabController _tabController;

  bool _isEmployeeProfileVisible = false;

  Widget get _currentDashBoardContent {
    if (_isEmployeeProfileVisible) {
      return const EmployeeProfileScreen();
    } else {
      return DashBoardContent(
        onEmployeeTap: _showEmployeeProfile,
      );
    }
  }

  List<Widget> get _tabsContent {
    return [
      DashBoardContent(
        onEmployeeTap: _showEmployeeProfile,
      ),
      const DepartmentsContent(),
      const ShiftsContent(),
    ];
  }

  void _showEmployeeProfile() {
    setState(() {
      _isEmployeeProfileVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabsContent.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
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
          ? BlocProvider(
              create: (context) => LogoutCubit(),
              child: AdminCustomDrawer(
                tabController: _tabController,
                // scaffoldState: scaffoldKey.currentState!,
              ),
            )
          : null,
      backgroundColor: Colors.black,
      body: Row(
        children: [
          MediaQuery.sizeOf(context).width < SizeConfig.tablet
              ? Container()
              : Expanded(
                  flex: 2,
                  child: BlocProvider(
                    create: (context) => LogoutCubit(),
                    child: AdminCustomDrawer(
                      tabController: _tabController,
                      // scaffoldState: scaffoldKey.currentState!,
                    ),
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
