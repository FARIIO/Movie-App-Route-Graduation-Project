import 'package:flutter/material.dart';
import 'package:movie_app_graduation_project_route/ui/screens/home_screen/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app_graduation_project_route/ui/screens/home_screen/tabs/search_tab/search_tab.dart';

import '../../../core/utils/app_colors.dart';
import 'tabs/homeTab.dart';
import 'tabs/profileTab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    const HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  BottomNavigationBarItem _buildNavItem(String iconPath) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ImageIcon(AssetImage(iconPath), size: 28),
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      body: IndexedStack(index: _currentIndex, children: tabs),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).padding.bottom + 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.greyColor,
            selectedItemColor: AppColors.yellowColor,
            unselectedItemColor: AppColors.whiteColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: [
              _buildNavItem('assets/images/home_icon.png'),
              _buildNavItem('assets/images/search_icon.png'),
              _buildNavItem('assets/images/browse_icon.png'),
              _buildNavItem('assets/images/profile_icon.png'),
            ],
          ),
        ),
      ),
    );
  }
}
