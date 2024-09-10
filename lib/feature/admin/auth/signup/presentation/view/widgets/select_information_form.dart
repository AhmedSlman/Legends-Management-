import 'package:flutter/material.dart';
import 'package:legends_management/core/widgets/custom_button.dart';

import '../../../../../../../core/utils/app_styles.dart';
import 'drop_down_button.dart';

class SelectInformationForm extends StatefulWidget {
  const SelectInformationForm({super.key});

  @override
  State<SelectInformationForm> createState() => _SelectInformationFormState();
}

class _SelectInformationFormState extends State<SelectInformationForm> {
  String? selectedLevel1;
  String? selectedLevel2;
  String? selectedLevel3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/welcome_Rectangle.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Continue',
              style: AppStyles.styleBold40(context),
            ),
            const SizedBox(height: 100),
            Row(
              children: [
                Flexible(
                  child: ReusableDropDownButton(
                    selectedItem: selectedLevel1,
                    items: const ['Junior', 'Mid level', 'Senior'],
                    hint: 'Select Your Level',
                    onChanged: (value) {
                      setState(() {
                        selectedLevel1 = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 25),
                Flexible(
                  child: ReusableDropDownButton(
                    selectedItem: selectedLevel2,
                    items: const ['Junior', 'Mid level', 'Senior'],
                    hint: 'Select Your Level',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 25),
                Flexible(
                  child: ReusableDropDownButton(
                    selectedItem: selectedLevel3,
                    items: const ['Junior', 'Mid level', 'Senior'],
                    hint: 'Select Your Level',
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: CustomButton(
                buttonText: 'Sign Up',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
