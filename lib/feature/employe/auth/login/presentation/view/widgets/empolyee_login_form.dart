import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/viewmodel/logincubit/login_cubit.dart';

import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/network/local/cache_helper.dart';
import '../../../../../../../core/routes/routes_path.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/login/presentation/view/widgets/dont_have_account_widget.dart';
import '../../../../../../admin/auth/login/presentation/view/widgets/remember_and_forget_password_widget.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';

class EmpolyeeLoginForm extends StatefulWidget {
  const EmpolyeeLoginForm({super.key});

  @override
  State<EmpolyeeLoginForm> createState() => _EmpolyeeLoginFormState();
}

class _EmpolyeeLoginFormState extends State<EmpolyeeLoginForm> {
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
          padding: const EdgeInsets.all(64.0),
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is LoginSuccess || current is LoginFailure,
            listener: (context, state) {
              if (state is LoginSuccess) {
                showToast(
                    message: state.loginModel.message ?? '',
                    state: ToastStates.SUCCESS);
                CacheHelper.saveData(
                    key: 'employee_name', value: state.loginModel.user?.name);
                CacheHelper.saveData(
                    key: 'employee_role', value: state.loginModel.user?.role);
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.token)
                    .then(
                  (value) =>
                      GoRouter.of(context).push(RoutesPath.kEmployeHomeScreen),
                );
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
                  title: 'password',
                  hint: 'Enter Your password',
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
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Center(
                      child: CustomButton(
                        width: 350.w,
                        buttonText: 'Login',
                        onPressed: () {
                          if (_emailController.text.isEmpty ||
                              _passWordController.text.isEmpty) {
                            showToast(
                                message: 'Fields are required',
                                state: ToastStates.ERROR);
                          } else {
                            BlocProvider.of<LoginCubit>(context).userLogin(
                              email: _emailController.text,
                              passWord: _passWordController.text,
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(RoutesPath.kEmployeeSignUpView),
                  child: const DontHaveAccount(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
