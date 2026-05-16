class MovieModel {
  final String imagePath;
  final String title;
  final String year;
  final String rating;
  final String? likes;
  final String? duration;
  final String? summary;
  final List<String>? screenshots;
  final List<MovieModel>? similarMovies;
  final List<CastMember>? cast;
  final List<String>? genres;

  const MovieModel({
    required this.imagePath,
    required this.title,
    required this.year,
    required this.rating,
    this.likes,
    this.duration,
    this.summary,
    this.screenshots,
    this.similarMovies,
    this.cast,
    this.genres,
  });
}

class CastMember {
  final String name;
  final String character;
  final String imagePath;

  const CastMember({
    required this.name,
    required this.character,
    required this.imagePath,
  });
}
