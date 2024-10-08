import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/shimmer.dart';
import '../viewmodel/employeedepartmentcubit/employeebydepartment_cubit.dart';
import 'widgets/department_employee_card.dart';

class HrDepartmentContent extends StatelessWidget {
  const HrDepartmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Human Resource',
          style: AppStyles.styleBold40(context),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BlocProvider(
            create: (context) => EmployeebydepartmentCubit()
              ..getEmployeesByDepartments(department: 'Human Resource'),
            child: BlocBuilder<EmployeebydepartmentCubit,
                EmployeebydepartmentState>(
              builder: (context, state) {
                if (state is EmployeebydepartmentSuccess) {
                   return state.departmentModel.employees!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.sizeOf(context).width >
                                    SizeConfig.desktop
                                ? 2
                                : 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                            childAspectRatio: MediaQuery.sizeOf(context).width >
                                    SizeConfig.desktop
                                ? 7
                                : 4.5,
                          ),
                          itemCount: state.departmentModel.employees?.length,
                          itemBuilder: (context, index) {
                            return DepartmentEmployeeCard(
                              employees:
                                  state.departmentModel.employees![index],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'There is No Employees in this department',
                            style: AppStyles.styleRegular24(context),
                          ),
                        );
                } else if (state is EmployeebydepartmentLoading) {
                  return const ShimmerTaskCard();
                } else {
                  return  Center(
                    child: Text(
                      'No data',
                      style: AppStyles.styleRegular24(context),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
