import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';
import '../moviePoster.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: screenHeight * 0.7,
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
                top: screenHeight * 0.05,
                child: Image.asset(
                  'assets/images/availablenow.png',
                  width: screenWidth * 0.6,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: screenHeight * 0.15,
                height: screenHeight * 0.4,
                width: screenWidth,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) =>
                      setState(() => _currentPage = page),
                  itemCount: carouselPosters.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double scale = 0.8;
                        if (_pageController.hasClients) {
                          double page =
                              _pageController.page ?? _currentPage.toDouble();
                          scale = (1 - (page - index).abs() * 0.2).clamp(
                            0.8,
                            1.0,
                          );
                        }
                        return Transform.scale(scale: scale, child: child);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MoviePoster(imagePath: carouselPosters[index]),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                bottom: screenHeight * 0.05,
                child: Image.asset(
                  'assets/images/watchnow.png',
                  width: screenWidth * 0.8,
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
