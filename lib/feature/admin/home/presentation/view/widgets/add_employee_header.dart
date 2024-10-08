import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/core/utils/app_styles.dart';
import '../../viewmodel/emoloyeescountcubit/employees_cubit.dart';


class AddEmployeeHeader extends StatelessWidget {
  const AddEmployeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeesCubit()..fetchEmployeeCount(),
      child: BlocBuilder<EmployeesCubit, EmployeesState>(
        builder: (context, state) {
          // Default employee count
          String employeeCount = '...';

          if (state is EmployeesCountsuccess) {
            employeeCount = state.count.toString();
          } else if (state is EmployeesCountLoading) {
            employeeCount = 'Loading'; // Loading state
          } else if (state is EmployeesCountFailure) {
            employeeCount = 'Error'; // Error state
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: employeeCount,
                      style: AppStyles.styleRegular32(context),
                    ),
                    TextSpan(
                      text: ' Employees',
                      style: AppStyles.styleRegularRed32(context),
                    ),
                  ],
                ),
              ),
              // CustomButton(
              //   width: 79,
              //   buttonText: 'Add',
              //   onPressed: () {},
              // ),
            ],
          );
        },
      ),
    );
  }
}
