
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/utils/managers/api_manager.dart';
import 'package:netflix_clone/features/home/data/models/movie_model/show.dart';
import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<MovieEntity>> getMovies();
}

class MovieDataSourceImpl implements MovieDataSource {
  final Dio dio;

  MovieDataSourceImpl(this.dio);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final response = await dio.get(ApiManager.getMoviesBaseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> results = response.data;

      return results
          .where((result) => result['show']?['image']?['original'] != null)
          .map(
            (result) => Show.fromJson(result['show']),
          )
          .toList();
    } else {
      throw Exception('Failed to load show details');
    }
  }

  // @override
  // Future<List<MovieEntity>> getMovies() async {
  //   try {
  //     // Fetch data using Dio
  //     var response = await apiService.get(endPoint: '/search/shows?q=all');
  //     // log('API Response: ${response.data}');

  //     // Ensure data is a List
  //     if (response is List) {
  //       List<MovieEntity> movies = getMoviesList(response);
  //       log('Movies fetched: $movies');
  //       return movies;
  //     } else {
  //       throw Exception("Unexpected response format: $response");
  //     }
  //   } catch (e) {
  //     log('Error fetching movies: $e');
  //     return [];
  //   }
  // }

  // List<MovieEntity> getMoviesList(Map<String, dynamic> data) {
  //   List<MovieEntity> movies = [];
  //   for (var item in data['show']) {
  //     movies.add(Show.fromJson(item['show']));
  //   }
  //   return movies;
  // }
}
