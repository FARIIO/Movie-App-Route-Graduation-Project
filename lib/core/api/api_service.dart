import 'package:dio/dio.dart';
import '../../ui/screens/movie_details_screen/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Object?>> getMovies() async {
    try {
      final response = await _dio.get('https://yts.mx/api/v2/list_movies.json');
      if (response.statusCode == 200) {
        List data = response.data['data']['movies'];
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}