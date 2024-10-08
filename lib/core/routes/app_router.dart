import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/widgets/legends_management_view.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/view/admin_login_screen.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/viewmodel/cubit/reset_forget_password_cubit.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/viewmodel/logincubit/login_cubit.dart';
import 'package:legends_management/feature/admin/auth/signup/presentation/view/admin_signup_screen.dart';
import 'package:legends_management/feature/admin/home/presentation/viewmodel/logoutcubit/logout_cubit.dart';
import 'package:legends_management/feature/employe/auth/login/presentation/view/forget_password_screen.dart';
import 'package:legends_management/feature/employe/auth/login/presentation/view/reset_password_screen.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/view/email_verification_screen.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/view/select_information_screen.dart';
import 'package:legends_management/feature/admin/auth/signup/presentation/viewmodel/cubit/admin_register_cubit.dart';
import 'package:legends_management/feature/admin/home/presentation/view/admin_home_screen.dart';
import 'package:legends_management/feature/employe/auth/login/presentation/view/employee_login_screen.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/view/employee_signup_screen.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/viewmodel/employee_register_cubit/employee_register_cubit.dart';
import 'package:legends_management/feature/employe/home/presentation/views/employe_home_view.dart';
import 'package:legends_management/feature/employe/profile/presentation/view/employee_profile_screen.dart';
import 'package:legends_management/feature/welcome/presentation/web/welcome_screen_web.dart';

import 'routes_path.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: RoutesPath.klegendsManagementView,
        builder: (BuildContext context, GoRouterState state) {
          if (myToken != null && adminRole == 'manager') {
            return const AdminHomeScreen();
          } else if (myToken != null && employeeRole == 'employee') {
            return BlocProvider(
              create: (context) => LogoutCubit(),
              child: const EmployeHomeScreen(),
            );
          } else {
            return const LegendsManagementView();
          }
        },
      ),
      GoRoute(
        path: RoutesPath.kWelcomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreenWeb(),
      ),
      GoRoute(
        path: RoutesPath.kAdminSignUpView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => AdminRegisterCubit(),
          child: const AdminSignUpScreen(),
        ),
      ),
      GoRoute(
        path: RoutesPath.kEmployeeSignUpView,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeeSignUpScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeeSelectInformationView,
        builder: (BuildContext context, GoRouterState state) {
          // Extract the employee data from the 'extra' property
          final employeeData = state.extra as Map<String, String>? ?? {};

          return BlocProvider(
            create: (context) => EmployeeRegisterCubit(),
            child: AdminSelectInformationScreen(employeeData: employeeData),
          );
        },
      ),
      GoRoute(
        path: RoutesPath.kAdminLoginView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const AdminLoginScreen(),
        ),
      ),
      GoRoute(
        path: RoutesPath.kEmployeeLoginView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const EmployeeLoginScreen(),
        ),
      ),
      GoRoute(
        path: RoutesPath.kAdminHomeScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminHomeScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeHomeScreen,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => LogoutCubit(),
          child: const EmployeHomeScreen(),
        ),
      ),
      GoRoute(
        path: RoutesPath.kEmployeProfileScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeeProfileScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeForgetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: RoutesPath.kEmployeResetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => ResetForgetPasswordCubit(),
          child: const ResetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: RoutesPath.kemployeeverifypasswordscreen,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => ResetForgetPasswordCubit(),
          child: const EmailVerificationScreen(),
        ),
      ),
    ],
  );
}
