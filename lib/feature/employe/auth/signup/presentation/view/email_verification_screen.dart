import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'widgets/email_verification_form.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: EmailVerificationForm(), // Your form widget
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/logo.png'),
                )
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Expanded(
                  flex: 3,
                  child: EmailVerificationForm(),
                ),
              ],
            ),
    );
  }
}
