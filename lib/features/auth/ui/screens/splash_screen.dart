import 'package:flutter/material.dart';
import 'package:quomodosoft_task/features/auth/ui/screens/welcome_screen.dart';
import '../../../../app/assets_path.dart';

/// Splash screen with fade and scale animations,
/// then navigates to WelcomeScreen after a delay.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Fade-in animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    // Scale-up animation
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    // Start the animation
    _controller.forward();
    // Schedule navigation to the welcome screen
    _moveToWelcomeScreen();
  }

  /// Automatic Welcome Screen Navigator with 2 seconds delay
  Future<void> _moveToWelcomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            children: [
              const Spacer(),

              // Logo with scale animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(AssetsPath.appLogo, width: 150),
              ),

              const SizedBox(height: 16),

              const Text(
                'Welcome to the \n World of Luxury Automobiles',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),

              const Spacer(),

              // Loading indicator
              const CircularProgressIndicator(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
