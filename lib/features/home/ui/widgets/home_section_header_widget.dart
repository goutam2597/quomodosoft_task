import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../common/ui/widgets/search_bar_widget.dart';

/// Home screen top section with user info, compare icon, and a floating search bar
class HomeSectionHeaderWidget extends StatelessWidget {
  const HomeSectionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Header background container
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          decoration: const BoxDecoration(color: AppColors.themeColor),
          child: Row(
            children: [
              // User avatar
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(AssetsPath.avatar),
              ),
              const SizedBox(width: 10),
              // Greeting and username
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Good Morning!',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'Wilson AH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Compare icon with notification badge
              Stack(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white, width: 0.4),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AssetsPath.compareIcon),
                    ),
                  ),
                  // Notification badge
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Floating search bar below header
        Positioned(
          bottom: -25,
          left: 16,
          right: 16,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(6),
            child: SearchBarWidget(showSuffixIcon: true,),
          ),
        ),
      ],
    );
  }
}