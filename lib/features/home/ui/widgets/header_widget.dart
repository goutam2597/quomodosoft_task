import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

/// A header row with a section title on the left and a "View More" button on the right.
class HeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HeaderWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title text
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.headingColor,
          ),
        ),
        // "View More" button on the right
        TextButton(onPressed: onTap, child: const Text('View More')),
      ],
    );
  }
}
