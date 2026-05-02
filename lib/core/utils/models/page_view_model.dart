

import '../app_assets.dart';

class PageViewModel {
  final String image;

  final String? title;
  final String? subTitle;
  final bool? isNext;
  final bool? isPrevious;

  PageViewModel({required this.image, this.title, this.subTitle,this.isNext=true,this.isPrevious=true});

  static List<PageViewModel> pageList = [
    PageViewModel(
      isPrevious:false,
      image: AppAssets.onBoardingImageTwo,
      title: "Discover Movies",
      subTitle:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    ),
    PageViewModel(

      image: AppAssets.onBoardingImageThree,
      title: "Explore All Genres",
      subTitle:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    ),
    PageViewModel(
      image: AppAssets.onBoardingImageFour,
      title: "Create Watchlists",
      subTitle:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    ),
    PageViewModel(
      image: AppAssets.onBoardingImageFive,
      title: "Rate, Review, and Learn",
      subTitle:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    PageViewModel(image: AppAssets.onBoardingImageSix,title: "Start Watching Now"),
  ];
}
