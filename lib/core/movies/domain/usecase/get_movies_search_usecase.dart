import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/repo/movie_repo.dart';
import 'package:netflix_clone/core/utils/usecase/usecase.dart';

class GetSearchMoviesUseCase
    extends Usecase<List<MovieEntity>, SearchMoviesParams> {
  final MovieRepo movieRepo;

  GetSearchMoviesUseCase(this.movieRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    SearchMoviesParams? param,
  ) async {
    return await movieRepo.getMoviesSearch(param!);
  }
}

class SearchMoviesParams {
  final String query;

  const SearchMoviesParams({required this.query});
}
