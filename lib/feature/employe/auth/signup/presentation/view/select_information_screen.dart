// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'widgets/select_information_form.dart';

class AdminSelectInformationScreen extends StatelessWidget {
  const AdminSelectInformationScreen({
    super.key,
    required this.employeeData,
  });
  final Map<String, String> employeeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SelectInformationForm(
                      employeeData: employeeData,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SelectInformationForm(
                    employeeData: employeeData,
                  ),
                ),
              ],
            ),
    );
  }
}
