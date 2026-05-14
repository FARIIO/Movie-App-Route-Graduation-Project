class MovieModel {
  final int id;
  final String title;
  final String rating;
  final String largeCoverImage;
  final String summary;

  MovieModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.largeCoverImage,
    required this.summary,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'].toString(),
      largeCoverImage: json['large_cover_image'],
      summary: json['summary'],
    );
  }
}