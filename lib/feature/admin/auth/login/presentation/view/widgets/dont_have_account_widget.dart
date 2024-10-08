import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have account? ',
              style: AppStyles.styleRegular24(context).copyWith(
                color: const Color(0xff535353),
              ),
            ),
            TextSpan(
              text: 'Signup',
              style: AppStyles.styleRegular24(context).copyWith(
                color: const Color(0xffFF4811),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
