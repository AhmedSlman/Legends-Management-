import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/view/widgets/already_have_account_widet.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';

class EmployeeSignUpForm extends StatelessWidget {
  const EmployeeSignUpForm({super.key});

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
            const TitleTextField(
              title: 'Name',
              hint: 'Enter Your name',
            ),
            const SizedBox(
              height: 5,
            ),
            const TitleTextField(
              title: 'Email',
              hint: 'Enter Your Email',
            ),
            const SizedBox(
              height: 5,
            ),
            const TitleTextField(
              title: 'Phone',
              hint: 'Enter Your Phone',
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            const TitleTextField(
              title: 'password',
              hint: 'Enter Your password',
            ),
            const SizedBox(
              height: 5,
            ),
            const TitleTextField(
              title: 'Confirm password',
              hint: 'Confirm password',
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                width: 350.w,
                buttonText: 'Next',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () =>
                  GoRouter.of(context).push(RoutesPath.kEmployeeLoginView),
              child: const Center(
                child: AlreadyHaveAnAccount(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
