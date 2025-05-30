import 'package:flutter/material.dart';
import 'package:quomodosoft_task/features/auth/ui/screens/splash_screen.dart';

import 'app_theme_data.dart';

class TaskAssignment extends StatelessWidget {
  const TaskAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
    );
  }
}
