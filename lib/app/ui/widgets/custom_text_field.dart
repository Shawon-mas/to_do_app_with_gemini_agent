
import 'package:flutter/material.dart';
import 'package:to_do_app_with_gemini_agent/app/constants/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: AppTextStyles.body,
        border: OutlineInputBorder(),
      ),
    );
  }
}
