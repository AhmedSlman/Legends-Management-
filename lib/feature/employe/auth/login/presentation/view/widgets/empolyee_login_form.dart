import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                title: 'password',
                hint: 'Enter Your password',
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
                    GoRouter.of(context).push(RoutesPath.kEmployeHomeScreen);
                  },
                ),
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
    );
  }
}
