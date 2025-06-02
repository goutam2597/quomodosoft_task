import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quomodosoft_task/features/auth/ui/screens/splash_screen.dart';
import 'app_theme_data.dart';

/// The root widget of the application.
/// Uses GetX
class TaskAssignment extends StatelessWidget {
  const TaskAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(), // Initial screen when the app launches
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
    );
  }
}
