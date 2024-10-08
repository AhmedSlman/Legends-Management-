// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:legends_management/core/widgets/custom_button.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/viewmodel/employee_register_cubit/employee_register_cubit.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/routes/routes_path.dart';
import '../../../../../../../core/utils/app_styles.dart';
import 'drop_down_button.dart';

class SelectInformationForm extends StatefulWidget {
  final Map<String, String> employeeData;

  const SelectInformationForm({
    super.key,
    required this.employeeData,
  });

  @override
  State<SelectInformationForm> createState() => _SelectInformationFormState();
}

class _SelectInformationFormState extends State<SelectInformationForm> {
  String? selectedLevel;
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/welcome_Rectangle.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: BlocListener<EmployeeRegisterCubit, EmployeeRegisterState>(
          listenWhen: (previous, current) =>
              current is EmployeeRegisterSuccess ||
              current is EmployeeRegisterFailure,
          listener: (context, state) {
            if (state is EmployeeRegisterSuccess) {
              if (widget.employeeData['manager_code'] != employeeCode) {
                showToast(
                  message: 'Please check the Employee manager',
                  state: ToastStates.ERROR,
                );
              } else {
                showToast(
                    message: state.employeeRegisterModel.message ?? '',
                    state: ToastStates.SUCCESS);
                // CacheHelper.saveDate(
                //         key: 'token', value: state.adminRegisterModel.manager)
                //     .then(
                //   (value) =>
                //       GoRouter.of(context).push(RoutesPath.kAdminHomeScreen),
                // );

                GoRouter.of(context)
                    .push(RoutesPath.kemployeeverifypasswordscreen);
              }
            } else if (state is EmployeeRegisterFailure) {
              showToast(message: state.errMsg, state: ToastStates.ERROR);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Continue',
                style: AppStyles.styleBold40(context),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Flexible(
                    child: ReusableDropDownButton(
                      selectedItem: selectedLevel,
                      items: const ['Junior', 'Mid-level', 'Senior'],
                      hint: 'Select Your Level',
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 25),
                  Flexible(
                    child: ReusableDropDownButton(
                      selectedItem: selectedDepartment,
                      items: const [
                        'Marketing',
                        'Sales',
                        'Design',
                        'Development',
                        'Human Resource',
                        'Accounting and Finance'
                      ],
                      hint: 'Select Your department',
                      onChanged: (value) {
                        setState(() {
                          selectedDepartment = value;
                        });
                      },
                    ),
                  ),
                  // const SizedBox(width: 25),
                  // Flexible(
                  //   child: ReusableDropDownButton(
                  //     selectedItem: selectedLevel3,
                  //     items: const ['Junior', 'Mid level', 'Senior'],
                  //     hint: 'Select Your Level',
                  //     onChanged: (value) {},
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: CustomButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    BlocProvider.of<EmployeeRegisterCubit>(context)
                        .employeeRegister(
                      name: widget.employeeData['name']!,
                      email: widget.employeeData['email']!,
                      passWord: widget.employeeData['password']!,
                      phone: widget.employeeData['phone']!,
                      passwordconfirmation:
                          widget.employeeData['password_confirmation']!,
                      managercode: widget.employeeData['manager_code']!,
                      department: selectedDepartment!,
                      level: selectedLevel!,
                      bankaccount: widget.employeeData['bank_account']!,
                      image: widget.employeeData['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
