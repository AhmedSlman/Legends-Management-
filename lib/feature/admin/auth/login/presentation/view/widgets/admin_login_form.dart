import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../signup/presentation/view/widgets/title_text_field.dart';
import 'dont_have_account_widget.dart';
import 'remember_and_forget_password_widget.dart';

class AdminLoginForm extends StatefulWidget {
  const AdminLoginForm({super.key});

  @override
  State<AdminLoginForm> createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  bool rememberMe = false;

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
              const TitleTextField(
                title: 'Email',
                hint: 'Enter Your Email',
              ),
              const SizedBox(
                height: 5,
              ),
              const TitleTextField(
                title: 'Password',
                hint: 'Enter Your password',
              ),
              const SizedBox(
                height: 5,
              ),
              const TitleTextField(
                title: 'Admin Code',
                hint: 'Enter Your Admin Code',
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
                    // Handle login action
                    GoRouter.of(context).push(RoutesPath.kAdminHomeScreen);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () =>
                    GoRouter.of(context).push(RoutesPath.kAdminSignUpView),
                child: const DontHaveAccount(),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

