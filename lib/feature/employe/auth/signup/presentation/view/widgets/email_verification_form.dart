import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legends_management/core/routes/routes_path.dart';
import 'package:legends_management/feature/employe/auth/signup/presentation/viewmodel/emailverification/email_verfication_cubit.dart';

import '../../../../../../../core/functions/show_toast.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';

class EmailVerificationForm extends StatefulWidget {
  const EmailVerificationForm({super.key});

  @override
  State<EmailVerificationForm> createState() => _EmailVerificationFormState();
}

class _EmailVerificationFormState extends State<EmailVerificationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerficationCubit(),
      child: BlocListener<EmailVerficationCubit, EmailVerficationState>(
        listener: (context, state) {
          if (state is EmailVerificationSuccess) {
            showToast(
                message: 'Email verified successfully!',
                state: ToastStates.SUCCESS);
            GoRouter.of(context).push(
              RoutesPath.kWelcomeView,
            ); // Navigate to another screen after verification
          } else if (state is EmailVerificationFailure) {
            showToast(message: state.errMsg, state: ToastStates.ERROR);
          }
        },
        child: Container(
          padding: EdgeInsets.all(32.h),
          margin: EdgeInsets.all(32.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_Rectangle.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verify Your Email',
                    style: AppStyles.styleBold40(context),
                  ),
                  const SizedBox(height: 20),
                  TitleTextField(
                    title: 'Email',
                    hint: 'Enter Your Email',
                    textEditingController: _emailController,
                  ),
                  const SizedBox(height: 10),
                  TitleTextField(
                    title: 'Verification Code',
                    hint: 'Enter the Verification Code',
                    textEditingController: _codeController,
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: BlocBuilder<EmailVerficationCubit,
                        EmailVerficationState>(
                      builder: (context, state) {
                        if (state is EmailVerificationLoading) {
                          return const CircularProgressIndicator();
                        }
                        return CustomButton(
                          width: 350.w,
                          buttonText: 'Verify Email',
                          onPressed: () {
                            final email = _emailController.text;
                            final code = _codeController.text;

                            // Call the email verification method
                            context.read<EmailVerficationCubit>().verifyEmail(
                                  email: email,
                                  verificationCode: code,
                                );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
