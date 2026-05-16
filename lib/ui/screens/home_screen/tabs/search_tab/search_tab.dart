import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_graduation_project_route/core/utils/app_assets.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/login_screen/widgets/custom_text_field.dart';

import '../../../movie_details_screen/app_data.dart';
import '../../moviePoster.dart';

class SearchTab extends StatelessWidget {
  List<String> moviePosters = [
    AppAssets.movie1917,
    AppAssets.docStrange,
    AppAssets.blackWidow,
    AppAssets.captain,
    AppAssets.ironMan,
    AppAssets.darkKnight,
  ];

  SearchTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        children: [
          CustomTextFormField(
            prefixIcon: SvgPicture.asset(
              AppAssets.searchIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
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
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
