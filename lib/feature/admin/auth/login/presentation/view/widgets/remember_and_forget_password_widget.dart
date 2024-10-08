import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';

import '../../../../../../../core/utils/app_styles.dart';

class RememberAndForgetPassword extends StatefulWidget {
  const RememberAndForgetPassword({super.key});

  @override
  State<RememberAndForgetPassword> createState() =>
      _RememberAndForgetPasswordState();
}

class _RememberAndForgetPasswordState extends State<RememberAndForgetPassword> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (bool? newValue) {
                  setState(() {
                    rememberMe = newValue ?? false;
                  });
                },
              ),
              Text(
                'Remember Me',
                style: AppStyles.styleRegular14(context),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RoutesPath.kEmployeForgetPasswordScreen);
          },
          child: Text(
            'Forgot Password?',
            style: AppStyles.styleRegular14(context),
          ),
        ),
      ],
    );
  }
}
