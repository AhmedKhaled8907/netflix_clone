import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
