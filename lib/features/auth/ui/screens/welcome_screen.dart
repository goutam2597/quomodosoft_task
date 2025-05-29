import 'package:flutter/material.dart';
import 'package:quomodosoft_task/features/auth/ui/screens/login_screen.dart';
import 'package:quomodosoft_task/features/common/ui/screens/bottom_nav_bar.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';

/// Welcome screen that greets users with branding and navigation options.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),

                // App logo
                Image.asset(AssetsPath.appLogo, height: 100, width: 100),

                const Spacer(),

                // Welcome message
                const Text(
                  'Welcome to the \n World of Luxury Automobiles',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),

                const Spacer(),

                // Decorative frame or image
                Image.asset(AssetsPath.appFrame, fit: BoxFit.cover),

                const Spacer(),

                // Get Started button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(180),
                    ),
                    child: const Text('Get Started'),
                  ),
                ),

                const Spacer(),

                // Login instruction for existing users
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
