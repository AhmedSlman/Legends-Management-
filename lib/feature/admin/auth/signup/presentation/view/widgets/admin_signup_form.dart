import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';

import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../login/presentation/view/widgets/already_have_account_widet.dart';
import '../../viewmodel/cubit/admin_register_cubit.dart';
import 'title_text_field.dart';

class AdminSignUpForm extends StatefulWidget {
  const AdminSignUpForm({super.key});

  @override
  State<AdminSignUpForm> createState() => _AdminSignUpFormState();
}

class _AdminSignUpFormState extends State<AdminSignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }

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
        child: BlocListener<AdminRegisterCubit, AdminRegisterState>(
          listenWhen: (previous, current) =>
              current is AdminRegisterSuccess ||
              current is AdminRegisterFailure,
          listener: (context, state) {
            if (state is AdminRegisterSuccess) {
              showToast(
                  message: state.adminRegisterModel.message ??'',
                  state: ToastStates.SUCCESS);
              // CacheHelper.saveDate(
              //         key: 'token', value: state.adminRegisterModel.manager)
              //     .then(
              //   (value) =>
              //       GoRouter.of(context).push(RoutesPath.kAdminHomeScreen),
              // );

              GoRouter.of(context).push(RoutesPath.kAdminHomeScreen);
            } else if (state is AdminRegisterFailure) {
              showToast(message: state.errMsg, state: ToastStates.ERROR);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome To LEGENDS',
                style: AppStyles.styleBold40(context),
              ),
              const SizedBox(
                height: 20,
              ),
              TitleTextField(
                title: 'Name',
                hint: 'Enter Your name',
                textEditingController: _nameController, // Pass the controller
              ),
              const SizedBox(height: 5),
              TitleTextField(
                title: 'Email',
                hint: 'Enter Your Email',
                textEditingController: _emailController, // Pass the controller
              ),
              const SizedBox(height: 5),
              TitleTextField(
                title: 'Phone',
                hint: 'Enter Your Phone',
                textEditingController: _phoneController, // Pass the controller
              ),
              const SizedBox(height: 5),
              TitleTextField(
                title: 'Bank Account',
                hint: 'Enter Your bank account',
                textEditingController:
                    _bankAccountController, // Pass the controller
              ),
              const SizedBox(height: 5),
              TitleTextField(
                title: 'Password',
                hint: 'Enter Your password',
                textEditingController:
                    _passwordController, // Pass the controller
              ),
              const SizedBox(height: 5),
              TitleTextField(
                title: 'Confirm Password',
                hint: 'Confirm password',
                textEditingController:
                    _confirmPasswordController, // Pass the controller
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomButton(
                  width: 350.w,
                  buttonText: 'Next',
                  onPressed: () {
                    // GoRouter.of(context)
                    //     .push(RoutesPath.kAdminSelectInformationView);
                    BlocProvider.of<AdminRegisterCubit>(context).adminRegister(
                      name: _nameController.text,
                      email: _emailController.text,
                      passWord: _passwordController.text,
                      phone: _phoneController.text,
                      passwordconfirmation: _confirmPasswordController.text,
                      bankaccount: _bankAccountController.text,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(RoutesPath.kAdminLoginView),
                  child: const AlreadyHaveAnAccount(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
