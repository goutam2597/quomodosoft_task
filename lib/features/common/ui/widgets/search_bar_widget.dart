import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final bool showSuffixIcon;

  const SearchBarWidget({super.key, this.showSuffixIcon = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search here...',
        prefixIcon: const Icon(Icons.search),

        // Conditional suffix icon
        suffixIcon: showSuffixIcon
            ? Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.headingColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              )
            : null,

        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
