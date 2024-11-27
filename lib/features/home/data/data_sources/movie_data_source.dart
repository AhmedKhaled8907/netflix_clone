import 'package:netflix_clone/core/utils/managers/api_manager.dart';
import 'package:netflix_clone/features/home/data/models/movie_model/movie_model.dart';
import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<MovieEntity>> getMovies();
}

class MovieDataSourceImpl implements MovieDataSource {
  final ApiService apiService;

  MovieDataSourceImpl(this.apiService);

  @override
  Future<List<MovieEntity>> getMovies() async {
    var result = await apiService.get(endPoint: ApiManager.homePath);
    List<MovieEntity> movies = getMoviesList(result);
    return movies;
  }

  List<MovieEntity> getMoviesList(Map<String, dynamic> result) {
    List<MovieEntity> movies = [];
    for (var movie in result['show']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }
}
