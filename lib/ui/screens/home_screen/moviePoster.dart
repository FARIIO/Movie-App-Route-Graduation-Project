import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_style.dart';
import '../movie_details_screen/Screen/movie_details.dart';
import '../movie_details_screen/movie_model.dart';

class MoviePoster extends StatelessWidget {
  final MovieModel? movie;
  final String? imagePath;

  const MoviePoster({super.key, this.movie, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final String displayPath = movie?.imagePath ?? imagePath ?? '';
    final String displayRating = movie?.rating ?? "7.7";

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double borderRadius = width * 0.1;
        final double badgePaddingH = width * 0.05;
        final double badgePaddingV = width * 0.025;
        final double fontSize = (width * 0.08).clamp(10.0, 16.0);
        final double iconSize = (width * 0.07).clamp(8.0, 14.0);

        return GestureDetector(
          onTap: () {
            if (movie != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(movie: movie!),
                ),
              );
            }
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    borderRadius.clamp(8, 15),
                  ),
                  child: Image.asset(
                    displayPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.greyColor,
                      child: Icon(
                        Icons.broken_image,
                        color: AppColors.whiteColor,
                        size: width * 0.3,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: width * 0.05,
                  left: width * 0.05,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: badgePaddingH,
                      vertical: badgePaddingV,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(borderRadius * 0.5),
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: width * 0.005,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                          size: iconSize,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          displayRating,
                          style: AppTextStyle.regular14Weight.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
