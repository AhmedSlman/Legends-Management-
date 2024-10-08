import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/routes/routes_path.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/login/presentation/viewmodel/cubit/reset_forget_password_cubit.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';


class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                'Forgot Password?',
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
                height: 25,
              ),
              Center(
                child: CustomButton(
                  width: 350.w,
                  buttonText: 'Send Reset Link',
                  onPressed: () {
                    final email = _emailController.text;

                    // Call the forgetPassword method from the cubit
                    BlocProvider.of<ResetForgetPasswordCubit>(context).forgetPassword(email: email);
                    
                    // Optionally, navigate to another screen or show a message
                    GoRouter.of(context).push(RoutesPath.kEmployeResetPasswordScreen);
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
