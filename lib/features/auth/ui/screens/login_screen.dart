import 'package:flutter/material.dart';
import 'package:quomodosoft_task/app/app_colors.dart';
import 'package:quomodosoft_task/features/auth/ui/screens/signup_screen.dart';

import '../../../home/ui/screens/home_screens.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/custom_password_field_widget.dart';
import '../widgets/custom_text_field_widget.dart';
import '../widgets/social_login_widget.dart';

/// Login Screen Design

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

              // Login form container
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
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header texts
                        Text(
                          "Log in to your Account",
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.headingColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Welcome back! Please enter your details.",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 32),

                        // Name Field
                        const Text(
                          "Email*",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email here",
                          validatorMessage: "Email is required",
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        const Text(
                          "Password*",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        CustomPasswordField(
                          controller: _passwordController,
                          hintText: "********",
                          validatorMessage:
                              "Password must be at least 8 characters",
                        ),
                        const SizedBox(height: 6),

                        // Remember Me and Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCheckboxWithLabel(
                              label: "Remember Me",
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Forgot Password ?"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              }
                            },
                            child: const Text("Login"),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Navigation to Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text("Sign Up"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 130),

                        // Social Login Section
                        Center(
                          child: Text(
                            "Register with:",
                            style: textTheme.bodyMedium?.copyWith(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
