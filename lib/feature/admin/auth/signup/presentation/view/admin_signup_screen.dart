// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'widgets/admin_login_form.dart';

class AdminSignUpScreen extends StatelessWidget {
  const AdminSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: AdminSignUpForm(),
                ),
                Expanded(
                  flex: 1,
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
                  child: AdminSignUpForm(),
                ),
              ],
            ),
    );
  }
}
