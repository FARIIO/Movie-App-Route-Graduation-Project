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
<<<<<<< feat/home/home-tab
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
=======
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/av8.png'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "John Safwat",
                        style: AppTextStyle.regular20Weight.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  _buildStatColumn("12", "Wish List"),
                  _buildStatColumn("10", "History"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: AppTextStyle.regular20Weight.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Exit",
                        style: AppTextStyle.regular20Weight.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      icon: Icon(
                        Icons.exit_to_app_rounded,
                        color: AppColors.whiteColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            TabBar(
              indicatorColor: AppColors.yellowColor,
              labelColor: AppColors.yellowColor,
              unselectedLabelColor: AppColors.whiteColor,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: const ImageIcon(
                    AssetImage('assets/images/watch_list_icon.png'),
                  ),
                  child: Text(
                    "Watch List",
                    style: AppTextStyle.regular16Weight,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.folder_rounded,
                    color: AppColors.yellowColor,
                  ),
                  child: Text("History", style: AppTextStyle.regular16Weight),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [_buildEmptyState(), _buildHistoryGrid()],
              ),
>>>>>>> develop
            ),
          ],
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

  BottomNavigationBarItem _buildNavItem(String iconPath) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ImageIcon(AssetImage(iconPath), size: 28),
      ),
      label: '',
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SearchTab"));
  }
}

class BrowseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("BrowseTab"));
  }
}
