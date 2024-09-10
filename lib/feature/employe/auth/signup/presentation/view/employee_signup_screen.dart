import 'package:flutter/material.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/view/widgets/employee_signup_form.dart';

import '../../../../../../core/utils/size_config.dart';

class EmployeeSignUpScreen extends StatelessWidget {
  const EmployeeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: EmployeeSignUpForm(),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: EmployeeSignUpForm(),
                ),
              ],
            ),
    );
  }
}
