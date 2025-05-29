import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quomodosoft_task/app/app_colors.dart';

import '../widgets/custom_password_field_widget.dart';
import '../widgets/custom_text_field_widget.dart';
import '../widgets/social_login_widget.dart';

/// Sign Up Screen Design
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  // Text Editing controllers for user input fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, -5),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(
                        "Sign Up to your Account",
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.headingColor,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Name field
                      const Text(
                        "Name*",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name here",
                        validatorMessage: "Name is required",
                      ),

                      const SizedBox(height: 16),

                      // Email field
                      const Text(
                        "Email Address*",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email here",
                        validatorMessage: "Email is required",
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      const Text(
                        "Password*",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      CustomPasswordField(
                        controller: _passwordController,
                        hintText: "********",
                        validatorMessage:
                            "Password must be at least 8 characters",
                      ),

                      const SizedBox(height: 16),

                      // Confirm Password field
                      const Text(
                        "Confirm Password*",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      CustomPasswordField(
                        controller: _confirmPasswordController,
                        hintText: "********",
                        validatorMessage: "Please confirm your password",
                        customValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 8),

                      // Terms and conditions checkbox
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            activeColor: Colors.blue,
                            side: const BorderSide(color: Colors.blue),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            onChanged: (v) {
                              setState(() => _agreeToTerms = v ?? false);
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.black87,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "By signing up, you agree to our ",
                                  ),
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  const TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  const TextSpan(text: "."),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Sign Up button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            if (!_agreeToTerms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("You must agree to the terms."),
                                ),
                              );
                            } else if (_formKey.currentState!.validate()) {}
                          },
                          child: const Text("Sign Up"),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Navigation to login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Login"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Social login section
                      Center(
                        child: Text(
                          "Register with:",
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.headingColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SocialLoginWidget(
                        onGoogleTap: () {},
                        onFacebookTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
