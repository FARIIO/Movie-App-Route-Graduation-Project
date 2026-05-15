import 'package:flutter/material.dart';
import 'package:movie_app_graduation_project_route/core/utils/app_colors.dart';

import '../../../../core/utils/text_style.dart';
import '../movie_model.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  movie.imagePath,
                  height: screenHeight * 0.55,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: screenHeight * 0.55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.blackColor.withValues(alpha: 0.3),
                        Colors.transparent,
                        AppColors.blackColor,
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: CircleAvatar(
                      radius: screenWidth * 0.08,
                      backgroundColor: AppColors.yellowColor,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.whiteColor,
                        size: screenWidth * 0.12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.whiteColor,
                      size: screenWidth * 0.07,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  right: 16,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: AppColors.whiteColor,
                      size: screenWidth * 0.07,
                    ),
                    onPressed: () {
                      //todo : not done
                    },
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bold24White,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Text(
                      movie.year,
                      style: AppTextStyle.regular20Weight,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: (screenHeight * 0.07).clamp(48, 60),
                    child: ElevatedButton(
                      onPressed: () {
                        //todo : not done
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Watch', style: AppTextStyle.regular20Weight),
                    ),
                  ),
                  const SizedBox(height: 25),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StatBadge(
                            icon: Icons.favorite_sharp,
                            label: movie.likes ?? '15',
                            width: constraints.maxWidth * 0.3,
                          ),
                          _StatBadge(
                            icon: Icons.access_time_filled,
                            label: movie.duration ?? '90',
                            width: constraints.maxWidth * 0.3,
                          ),
                          _StatBadge(
                            icon: Icons.star,
                            label: movie.rating,
                            width: constraints.maxWidth * 0.3,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),

                  const _SectionTitle('Screen Shots'),
                  const SizedBox(height: 12),
                  if (movie.screenshots != null)
                    ...movie.screenshots!.map(
                      (path) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            path,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                  const _SectionTitle('Similar'),
                  const SizedBox(height: 12),
                  if (movie.similarMovies != null)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: movie.similarMovies!.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            movie.similarMovies![index].imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  const SizedBox(height: 24),

                  const _SectionTitle('Summary'),
                  const SizedBox(height: 10),
                  Text(
                    movie.summary ?? '',
                    style: AppTextStyle.regular20Weight.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  const _SectionTitle('Cast'),
                  const SizedBox(height: 12),
                  if (movie.cast != null)
                    ...movie.cast!.map(
                      (member) => _CastTile(
                        castMember: member,
                        screenWidth: screenWidth,
                      ),
                    ),
                  const SizedBox(height: 24),

                  const _SectionTitle('Genres'),
                  const SizedBox(height: 12),
                  if (movie.genres != null)
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: movie.genres!
                          .map(
                            (genre) => _GenreChip(
                              label: genre,
                              screenWidth: screenWidth,
                            ),
                          )
                          .toList(),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.bold24White.copyWith(fontSize: 20));
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final double width;
  const _StatBadge({
    required this.icon,
    required this.label,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.yellowColor, size: 20),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CastTile extends StatelessWidget {
  final CastMember castMember;
  final double screenWidth;
  const _CastTile({required this.castMember, required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              castMember.imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${castMember.name}',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: (screenWidth * 0.04).clamp(14, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Character: ${castMember.character}',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: (screenWidth * 0.03),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  final double screenWidth;
  const _GenreChip({required this.label, required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF282828),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: (screenWidth * 0.035).clamp(12, 14),
        ),
      ),
    );
  }
}
