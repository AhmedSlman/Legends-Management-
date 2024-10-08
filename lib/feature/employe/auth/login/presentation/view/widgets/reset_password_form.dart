import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/routes/routes_path.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/login/presentation/viewmodel/cubit/reset_forget_password_cubit.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
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
                height: 10,
              ),
              TitleTextField(
                title: 'Reset Code',
                hint: 'Enter Your Reset Code',
                textEditingController: _codeController,
              ),
              const SizedBox(
                height: 10,
              ),
              TitleTextField(
                title: 'New Password',
                hint: 'Enter Your New Password',
                textEditingController: _newPasswordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TitleTextField(
                title: 'Confirm Password',
                hint: 'Confirm Your New Password',
                textEditingController: _confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: CustomButton(
                  width: 350.w,
                  buttonText: 'Reset Password',
                  onPressed: () {
                    if (_newPasswordController.text ==
                        _confirmPasswordController.text) {
                      final email = _emailController.text;
                      final code = _codeController.text;
                      final newPassword = _newPasswordController.text;
                      final confirmPassword = _confirmPasswordController.text;

                      // Call the resetPassword method from the cubit
                      BlocProvider.of<ResetForgetPasswordCubit>(context)
                          .resetPassword(
                        email: email,
                        code: code,
                        newPassword: newPassword,
                        confirmPassword: confirmPassword,
                      );

                      showToast(
                          message: 'Password reset successfully!',
                          state: ToastStates.SUCCESS);
                      GoRouter.of(context).push(RoutesPath.kWelcomeView);
                    } else {
                      showToast(
                          message: 'Passwords do not match!',
                          state: ToastStates.ERROR);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
