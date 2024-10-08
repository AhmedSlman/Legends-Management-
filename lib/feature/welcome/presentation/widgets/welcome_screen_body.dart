import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';
import 'package:legends_management/core/utils/app_images.dart';

import '../../../../core/widgets/custom_button.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(32.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/welcome_Rectangle.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 160.h,
              top: 66.h,
              left: 132.w,
              right: 132.w,
            ),
            child: Column(
              children: [
                Image.asset(
                  Assets.imagesLogo,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonText: 'Log in As Admin',
                        onPressed: () {
                          GoRouter.of(context).push(RoutesPath.kAdminLoginView);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: CustomButton(
                        buttonText: 'Log in As Emloyee',
                        onPressed: () {
                          GoRouter.of(context)
                              .push(RoutesPath.kEmployeeLoginView);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
