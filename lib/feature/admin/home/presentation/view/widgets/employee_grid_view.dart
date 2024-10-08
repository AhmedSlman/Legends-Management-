import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/core/widgets/shimmer.dart';
import 'package:legends_management/feature/admin/home/presentation/viewmodel/allemployeescubit/all_employees_cubit.dart';

import '../../../../../../core/utils/size_config.dart';
import 'single_employee_card.dart';

class EmployeesGridView extends StatelessWidget {
  final VoidCallback onEmployeeTap;
  const EmployeesGridView({super.key, required this.onEmployeeTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => AllEmployeesCubit()..fetchAllEmployees(),
        child: BlocBuilder<AllEmployeesCubit, AllEmployeesState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final isTabletOrDesktop =
                    MediaQuery.sizeOf(context).width > SizeConfig.tablet;

                if (state is AllEmployeesSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTabletOrDesktop ? 2 : 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: isTabletOrDesktop ? 1.2 : 0.99,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.allEmployees.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: onEmployeeTap,
                        child: SingleEmployeeCard(
                          allEmployees: state.allEmployees[index],
                        ),
                      );
                    },
                  );
                } else if (state is AllEmployeesLoading) {
                  return const ShimmerTaskCard();
                } else {
                  return const Center(child: Text('No Employees Found'));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
