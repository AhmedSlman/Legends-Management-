import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundcolor,
    this.textColor,
    required this.buttonText,
    required this.onPressed,
    this.width,
  });

  final Color? backgroundcolor, textColor;
  final String buttonText;
  final void Function() onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          backgroundColor: backgroundcolor ?? const Color(0xffFF4811),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            buttonText,
            style: AppStyles.styleSemiBold20(context).copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
