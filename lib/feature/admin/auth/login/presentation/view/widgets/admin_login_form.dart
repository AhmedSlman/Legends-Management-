import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/routes/routes_path.dart';

import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/network/local/cache_helper.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../signup/presentation/view/widgets/title_text_field.dart';
import '../../viewmodel/logincubit/login_cubit.dart';
import 'remember_and_forget_password_widget.dart';

class AdminLoginForm extends StatefulWidget {
  const AdminLoginForm({super.key});

  @override
  State<AdminLoginForm> createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  bool rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.h),
      margin: EdgeInsets.all(32.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/welcome_Rectangle.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is LoginSuccess || current is LoginFailure,
            listener: (context, state) {
              if (state is LoginSuccess) {
                if (state.loginModel.user?.role == 'manager') {
                  showToast(
                      message: state.loginModel.message ?? '',
                      state: ToastStates.SUCCESS);

                  CacheHelper.saveData(
                      key: 'admin_role', value: state.loginModel.user?.role);

                  CacheHelper.saveData(
                          key: 'token', value: state.loginModel.token)
                      .then(
                    (value) =>
                        GoRouter.of(context).push(RoutesPath.kAdminHomeScreen),
                  );
                } else {
                  showToast(
                      message: 'You are not an admin',
                      state: ToastStates.ERROR);
                }
              } else if (state is LoginFailure) {
                showToast(message: state.errMsg, state: ToastStates.ERROR);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: AppStyles.styleBold40(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                TitleTextField(
                  title: 'Email',
                  hint: 'Enter Your Email',
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 5,
                ),
                TitleTextField(
                  title: 'Password',
                  hint: 'Enter Your Password',
                  textEditingController: _passWordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const RememberAndForgetPassword(),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomButton(
                    width: 350.w,
                    buttonText: 'Login',
                    onPressed: () {
                      if (_emailController.text.isEmpty ||
                          _passWordController.text.isEmpty) {
                        showToast(
                          message: 'Fields are required',
                          state: ToastStates.ERROR,
                        );
                      } else {
                        BlocProvider.of<LoginCubit>(context).userLogin(
                          email: _emailController.text,
                          passWord: _passWordController.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
