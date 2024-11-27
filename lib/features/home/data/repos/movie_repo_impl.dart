import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/features/home/data/data_sources/movie_data_source.dart';
import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';
import 'package:netflix_clone/features/home/domain/repo/movie_repo.dart';

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
}
