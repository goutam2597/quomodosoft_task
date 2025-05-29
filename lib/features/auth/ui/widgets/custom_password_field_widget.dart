import 'package:flutter/material.dart';

/// Reusable password input field.
class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String validatorMessage;
  final String? Function(String?)? customValidator;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validatorMessage,
    this.customValidator,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true; // Controls visibility of password text

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText, // Hides input if true
      decoration: InputDecoration(
        hintText: widget.hintText,
        // Toggle password visibility icon
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      // Password validator
      validator:
          widget.customValidator ??
          (value) {
            if (value == null || value.trim().length < 8) {
              return widget.validatorMessage;
            }
            return null;
          },
    );
  }
}
