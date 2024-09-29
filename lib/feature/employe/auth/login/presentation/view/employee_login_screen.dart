import 'package:flutter/material.dart';
import 'package:legends_management/feature/employe/auth/login/presentation/view/widgets/empolyee_login_form.dart';

import '../../../../../../core/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: EmpolyeeLoginForm(),
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
                  child: EmpolyeeLoginForm(),
                ),
              ],
            ),
    );
  }
}
