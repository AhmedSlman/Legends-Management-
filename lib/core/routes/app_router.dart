import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/widgets/legends_management_view.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/view/admin_login_screen.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/viewmodel/cubit/login_cubit.dart';
import 'package:legends_management/feature/admin/auth/signup/presentation/view/admin_signup_screen.dart';
import 'package:legends_management/feature/admin/auth/signup/presentation/view/select_information_screen.dart';
import 'package:legends_management/feature/admin/home/presentation/view/admin_home_screen.dart';
import 'package:legends_management/feature/employe/auth/login/presentation/view/employee_login_screen.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/view/employee_signup_screen.dart';
import 'package:legends_management/feature/employe/home/presentation/views/employe_home_view.dart';
import 'package:legends_management/feature/employe/home/presentation/views/employee_profile_screen.dart';
import 'package:legends_management/feature/welcome/presentation/web/welcome_screen_web.dart';

import 'routes_path.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: RoutesPath.klegendsManagementView,
        builder: (BuildContext context, GoRouterState state) =>
            const LegendsManagementView(),
      ),
      GoRoute(
        path: RoutesPath.kWelcomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreenWeb(),
      ),
      GoRoute(
        path: RoutesPath.kAdminSignUpView,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminSignUpScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeeSignUpView,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeeSignUpScreen(),
      ),
      GoRoute(
        path: RoutesPath.kAdminSelectInformationView,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminSelectInformationScreen(),
      ),
      GoRoute(
        path: RoutesPath.kAdminLoginView,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminLoginScreen(),
      ),
      GoRoute(
        path: RoutesPath.kLoginView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ),
      // GoRoute(
      //   path: RoutesPath.kAdminHomeScreen,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const AdminHomeScreen(),
      // ),
      GoRoute(
        path: RoutesPath.kEmployeHomeScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeHomeScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeProfileScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeeProfileScreen(),
      ),
    ],
  );
}
