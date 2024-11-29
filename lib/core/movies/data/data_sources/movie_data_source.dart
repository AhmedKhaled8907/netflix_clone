import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search_usecase.dart';
import 'package:netflix_clone/core/utils/managers/api_manager.dart';
import 'package:netflix_clone/core/movies/data/models/movie_model/show.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> getMoviesSearch(SearchMoviesParams param);
  Future<MovieEntity> getMovieDetails(
    MovieDetailsParams param,
  );
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
          .where((result) => result['show']?['image']?['medium'] != null)
          .map(
            (result) => Show.fromJson(result['show']),
          )
          .toList();
    } else {
      throw Exception('Failed to load show details');
    }
  }

  @override
  Future<List<MovieEntity>> getMoviesSearch(SearchMoviesParams param) async {
    var result = await dio.get(
      ApiManager.searchMoviesBaseUrl(param.query),
    );
    if (result.statusCode == 200) {
      final List<dynamic> results = result.data;
      log(results.toString());
      return results
          .where((result) => result['show']?['image']?['medium'] != null)
          .map(
            (result) => Show.fromJson(result['show']),
          )
          .toList();
    } else {
      throw Exception('Failed to load show details');
    }
  }

  @override
  Future<MovieEntity> getMovieDetails(MovieDetailsParams param) async {
    var result = await dio.get(
      // 'https://api.tvmaze.com/shows/${param.id}',
      ApiManager.movieDetailsBaseUrl(param.id),
    );
    if (result.statusCode == 200) {
      return Show.fromJson(result.data);
    } else {
      throw Exception('Failed to load show details');
    }
  }
}
