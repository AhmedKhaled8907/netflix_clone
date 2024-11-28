import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/movies/data/data_sources/movie_data_source.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/repo/movie_repo.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieDataSource movieDataSource;

  MovieRepoImpl({required this.movieDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      var result = await movieDataSource.getMovies();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesSearch(
      SearchMoviesParams param) async {
    try {
      var result = await movieDataSource.getMoviesSearch(param);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
