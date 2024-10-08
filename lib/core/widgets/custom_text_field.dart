import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.textEditingController,
    this.obscureText = false, // Default to false
  });

  final String hint;
  final TextEditingController? textEditingController;
  final bool obscureText; // New parameter

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText, // Set the obscureText property
      style: const TextStyle(color: Colors.white), // Set text color to white
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.styleSemiBold20(context).copyWith(
          color: const Color(0xff535353),
        ),
        fillColor: const Color(0xff101013), // Background color
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Color(0xff101013),
      ),
    );
  }
}
