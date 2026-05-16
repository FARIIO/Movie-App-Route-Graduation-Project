import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/utils/models/movie_model.dart';
import '../../data/models/movie_model.dart';

// States
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final List<MovieModel> movies;
  HomeSuccess(this.movies);
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

// Cubit
class HomeCubit extends Cubit<HomeState> {
  final ApiService apiService;
  HomeCubit(this.apiService) : super(HomeInitial());

  void fetchHomeMovies() async {
    emit(HomeLoading());
    try {
      final movies = await apiService.getMovies();
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}