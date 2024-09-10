import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'widgets/select_information_form.dart';

class AdminSelectInformationScreen extends StatelessWidget {
  const AdminSelectInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.sizeOf(context).width > SizeConfig.desktop
          ? Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: SelectInformationForm(),
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
                const Expanded(
                  flex: 3,
                  child: SelectInformationForm(),
                ),
              ],
            ),
    );
  }
}
