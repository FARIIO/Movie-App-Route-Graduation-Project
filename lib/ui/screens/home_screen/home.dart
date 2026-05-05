import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(canvasColor: AppColors.darkGreyColor),
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

                  selectedLabelStyle: const TextStyle(height: 0),
                  unselectedLabelStyle: const TextStyle(height: 0),

                  items: const [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                        ),
                      ),
                      label: '',
                    ),

                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ImageIcon(
                          AssetImage('assets/images/search_icon.png'),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ImageIcon(
                          AssetImage('assets/images/browse_icon.png'),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ImageIcon(
                          AssetImage('assets/images/profile_icon.png'),
                        ),
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("SearchTab"));
  }
}

class BrowseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("BrowseTab"));
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
            fontSize: 24,
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
    return Center(
      child: Image.asset('assets/images/empty_popcorn.png', width: 124),
    );
  }

  Widget _buildHistoryGrid() {
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
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

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController _pageController;
  int _currentPage = 1;

  final List<String> carouselPosters = [
    'assets/images/babydriver.jpg',
    'assets/images/sammendes.jpg',
    'assets/images/Captain.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 645,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sammendes.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xCC121312),
                      Color(0x99121312),
                      Color(0xFF121312),
                    ],
                    stops: [0.0, 0.6, 0.8],
                  ),
                ),
              ),

              Positioned(
                top: 7,
                left: 81,
                child: Image.asset(
                  'assets/images/availablenow.png',
                  width: 267,
                  height: 93,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 120,
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) =>
                      setState(() => _currentPage = page),
                  itemCount: carouselPosters.length,
                  itemBuilder: (context, index) {
                    double scale = (_currentPage == index) ? 1.0 : 0.8;
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) =>
                          Transform.scale(scale: scale, child: child),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MoviePoster(imagePath: carouselPosters[index]),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 493,
                left: 38,
                child: Image.asset(
                  'assets/images/watchnow.png',
                  width: 354,
                  height: 146,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          const ActionSection(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> actionPosters = [
      'assets/images/Captain.jpg',
      'assets/images/thedarkknight.jpg',
      'assets/images/blackwidow.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Action",
                style: AppTextStyle.regular20Weight.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                "See More >",
                style: AppTextStyle.regular16Weight.copyWith(
                  color: AppColors.yellowColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actionPosters.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  child: MoviePoster(imagePath: actionPosters[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String imagePath;
  final String rating;

  const MoviePoster({super.key, required this.imagePath, this.rating = "7.7"});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.whiteColor, width: 0.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rating,
                  style: AppTextStyle.regular16Weight.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: AppColors.yellowColor, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
