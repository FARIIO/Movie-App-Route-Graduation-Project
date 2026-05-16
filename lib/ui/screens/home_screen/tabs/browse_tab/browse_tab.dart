import 'package:flutter/material.dart';
import 'package:movie_app_graduation_project_route/ui/screens/home_screen/tabs/browse_tab/widgets/custom_tab_bar.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../movie_details_screen/app_data.dart';
import '../../moviePoster.dart';

class BrowseTab extends StatelessWidget {
  List<String> moviePosters = [
    AppAssets.movie1917,
    AppAssets.docStrange,
    AppAssets.blackWidow,
    AppAssets.captain,
    AppAssets.ironMan,
    AppAssets.darkKnight,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: moviePosters.length,
            itemBuilder: (context, index) {
              return MoviePoster(movie: AppData.movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
