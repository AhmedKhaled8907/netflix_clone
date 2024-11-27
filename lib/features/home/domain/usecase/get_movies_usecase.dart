import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/utils/usecase/usecase.dart';
import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';
import 'package:netflix_clone/features/home/domain/repo/movie_repo.dart';

class GetMoviesUsecase extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepo movieRepo;

  GetMoviesUsecase(this.movieRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call([NoParams? param]) async {
    return await movieRepo.getMovies();
  }
}
