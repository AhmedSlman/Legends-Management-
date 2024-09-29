import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_images.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/view/widgets/admin_login_form.dart';

import '../../../../../../core/utils/size_config.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: AdminLoginForm(),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(Assets.imagesLogo),
                )
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(Assets.imagesLogo),
                ),
                const Expanded(
                  flex: 3,
                  child: AdminLoginForm(),
                ),
              ],
            ),
    );
  }
}
