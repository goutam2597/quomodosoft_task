import 'package:flutter/material.dart';

/// Reusable custom text field with basic validation.
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String validatorMessage;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validatorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
      ),
      //Form Validation
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }
}
