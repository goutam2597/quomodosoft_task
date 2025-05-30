import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quomodosoft_task/app/app_colors.dart';
import 'package:quomodosoft_task/app/assets_path.dart';
import 'package:quomodosoft_task/features/home/ui/screens/home_screens.dart';

/// Main bottom navigation bar controller
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  /// Handles tab switch on bottom nav tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Navigation screens for each tab
  late final List<Widget> _navScreens;

  @override
  void initState() {
    super.initState();
    _navScreens = [
      const HomeScreen(),
      const Center(child: Text('Save')),
      const Center(child: Text('Message')),
      const Center(child: Text('More')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          // Home tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsPath.homeIcon,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0
                    ? AppColors.themeColor
                    : AppColors.headingColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),

          // Save tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsPath.heartIcon,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1
                    ? AppColors.themeColor
                    : AppColors.headingColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Save',
          ),

          // Message tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsPath.msgIcon,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2
                    ? AppColors.themeColor
                    : AppColors.headingColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Message',
          ),

          // More tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsPath.moreIcon,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3
                    ? AppColors.themeColor
                    : AppColors.headingColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
