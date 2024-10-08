import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/viewmodel/cubit/reset_forget_password_cubit.dart';

import '../../../../../../core/utils/size_config.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Row(
              children: [
                Expanded(
                  flex: 2,
                  child: BlocProvider(
                    create: (context) => ResetForgetPasswordCubit(),
                    child: const ForgotPasswordForm(),
                  ),
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
                Expanded(
                  flex: 3,
                  child: BlocProvider(
                    create: (context) => ResetForgetPasswordCubit(),
                    child: const ForgotPasswordForm(),
                  ),
                ),
              ],
            ),
    );
  }
}
