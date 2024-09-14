import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../login/presentation/view/widgets/already_have_account_widet.dart';
import 'title_text_field.dart';

class AdminSignUpForm extends StatelessWidget {
  const AdminSignUpForm({super.key});

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
            const TitleTextField(
              title: 'Admin Code',
              hint: 'Enter Your Admin Code',
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
              height: 10,
            ),
            Center(
              child: CustomButton(
                width: 350.w,
                buttonText: 'Next',
                onPressed: () {
                  GoRouter.of(context)
                      .push(RoutesPath.kAdminSelectInformationView);
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
    );
  }
}


