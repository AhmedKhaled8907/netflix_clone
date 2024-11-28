import 'dart:developer';

import 'package:dio/dio.dart';
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
    try {
      // Fetch data using Dio
      Response response =
          await Dio().get('https://api.tvmaze.com/search/shows?q=all');
      // log('API Response: ${response.data}');

      // Ensure data is a List
      if (response.data is List) {
        List<MovieEntity> movies = getMoviesList(response.data);
        log('Movies fetched: $movies');
        return movies;
      } else {
        throw Exception("Unexpected response format: ${response.data}");
      }
    } catch (e) {
      log('Error fetching movies: $e');
      return [];
    }
  }

  List<MovieEntity> getMoviesList(List<dynamic> data) {
    List<MovieEntity> movies = [];
    for (var item in data) {
      // Extract 'show' and ensure it is a Map
      if (item is Map<String, dynamic> && item['show'] != null) {
        // Convert the 'show' data into a MovieEntity via MovieModel
        movies.add(MovieModel.fromJson(item['show']));
      }
    }
    return movies;
  }
}
