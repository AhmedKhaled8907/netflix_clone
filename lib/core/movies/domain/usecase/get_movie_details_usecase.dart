import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/repo/movie_repo.dart';
import 'package:netflix_clone/core/utils/usecase/usecase.dart';

class GetMovieDetailsUsecase extends Usecase<MovieEntity, MovieDetailsParams> {
  final MovieRepo movieRepo;

  GetMovieDetailsUsecase(this.movieRepo);

  @override
  Future<Either<Failure, MovieEntity>> call(
    MovieDetailsParams? param,
  ) async {
    return await movieRepo.getMovieDetails(param!);
  }
}

class MovieDetailsParams {
  final int id;

  const MovieDetailsParams({required this.id});
}
