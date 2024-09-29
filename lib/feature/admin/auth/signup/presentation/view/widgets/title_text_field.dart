// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.textEditingController,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleRegular18(context),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
          textEditingController: textEditingController,
          hint: hint,
        ),
      ],
    );
  }
}
