import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search_usecase.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getMovies();

  Future<Either<Failure, List<MovieEntity>>> getMoviesSearch(
    SearchMoviesParams param,
  );

  Future<Either<Failure,MovieEntity>> getMovieDetails(
    MovieDetailsParams param,
  );
}
