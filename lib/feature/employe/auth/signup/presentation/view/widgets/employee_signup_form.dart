import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// For File handling

import 'package:legends_management/core/routes/routes_path.dart';
import 'package:legends_management/feature/admin/auth/login/presentation/view/widgets/already_have_account_widet.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../admin/auth/signup/presentation/view/widgets/title_text_field.dart';

class EmployeeSignUpForm extends StatefulWidget {
  const EmployeeSignUpForm({super.key});

  @override
  State<EmployeeSignUpForm> createState() => _EmployeeSignUpFormState();
}

class _EmployeeSignUpFormState extends State<EmployeeSignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _adminCodeController = TextEditingController();
  final TextEditingController _adminBankAccountController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _adminCodeController.dispose();
    _adminBankAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_Rectangle.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome To LEGENDS',
              style: AppStyles.styleBold40(context),
            ),
            const SizedBox(height: 20),
            TitleTextField(
              title: 'Name',
              hint: 'Enter Your name',
              textEditingController: _nameController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              title: 'Email',
              hint: 'Enter Your Email',
              textEditingController: _emailController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              title: 'Phone',
              hint: 'Enter Your Phone',
              textEditingController: _phoneController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              title: 'Admin Code',
              hint: 'Enter Your Admin Code',
              textEditingController: _adminCodeController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              title: 'Bank Account',
              hint: 'Enter Your Bank Account',
              textEditingController: _adminBankAccountController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              obscureText: true,
              title: 'Password',
              hint: 'Enter Your password',
              textEditingController: _passwordController,
            ),
            const SizedBox(height: 5),
            TitleTextField(
              obscureText: true,
              title: 'Confirm Password',
              hint: 'Confirm password',
              textEditingController: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            // const ImagePickerTextField(),
            // const SizedBox(height: 20),
            Center(
              child: CustomButton(
                width: 350.w,
                buttonText: 'Next',
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _phoneController.text.isEmpty ||
                      _adminCodeController.text.isEmpty ||
                      _adminBankAccountController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _confirmPasswordController.text.isEmpty) {
                    // Show a Snackbar or AlertDialog to inform the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return; // Exit the function if validation fails
                  }

                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    // Show an error if passwords do not match
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passwords do not match.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return; // Exit the function if passwords do not match
                  }

                  GoRouter.of(context).push(
                    RoutesPath.kEmployeeSelectInformationView,
                    extra: {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'phone': _phoneController.text,
                      'password': _passwordController.text,
                      'password_confirmation': _confirmPasswordController.text,
                      'manager_code': _adminCodeController.text,
                      'bank_account': _adminBankAccountController.text,
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () =>
                  GoRouter.of(context).push(RoutesPath.kEmployeeLoginView),
              child: const Center(
                child: AlreadyHaveAnAccount(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
