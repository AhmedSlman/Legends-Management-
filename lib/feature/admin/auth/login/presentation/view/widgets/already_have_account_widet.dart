import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppStyles.styleRegular24(context).copyWith(
              color: const Color(0xff535353),
            ),
          ),
          TextSpan(
            text: 'Login',
            style: AppStyles.styleRegular24(context).copyWith(
              color: const Color(0xffFF4811),
            ),
          ),
        ],
      ),
    );
  }
}
