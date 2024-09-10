// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.title,
    required this.hint,
  });

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleRegular16(context),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
          
          hint: hint,
        ),
      ],
    );
  }
}
