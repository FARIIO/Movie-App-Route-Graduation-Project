import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';
import '../moviePoster.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
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
                    style: AppTextStyle.regular16Weight.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.folder_rounded,
                    color: AppColors.yellowColor,
                  ),
                  child: Text(
                    "History",
                    style: AppTextStyle.regular16Weight.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [_buildEmptyState(), _buildHistoryGrid(context)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyle.regular16Weight.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        Text(
          label,
          style: AppTextStyle.regular16Weight.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(child: Image.asset('assets/images/empty_popcorn.png'));
  }

  Widget _buildHistoryGrid(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = screenWidth > 600 ? 5 : 3;

    final List<String> historyItems = [
      'assets/images/blackwidow.jpg',
      'assets/images/hobbs_shaw.jpg',
      'assets/images/1917.png',
      'assets/images/avengers.jpg',
      'assets/images/avengers2.jpg',
      'assets/images/blakwidow2.jpg',
      'assets/images/black_panther.jpg',
      'assets/images/doctor_strange.jpg',
      'assets/images/doctor_who.jpg',
      'assets/images/godzilla.jpg',
      'assets/images/wednesday.jpg',
      'assets/images/ironman.jpg',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        return MoviePoster(imagePath: historyItems[index]);
      },
    );
  }
}
