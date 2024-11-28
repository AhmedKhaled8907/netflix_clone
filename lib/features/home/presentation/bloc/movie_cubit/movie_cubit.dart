import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';
import 'package:netflix_clone/features/home/domain/usecase/get_movies_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.getMoviesUsecase) : super(MovieInitial());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> getMovieList() async {
    emit(MovieLoading());
    var result = await getMoviesUsecase.call();
    result.fold(
      (failure) => emit(MovieFailure(errMessage: failure.errMessage)),
      (movies) => emit(MovieSuccess(movies: movies)),
    );
  }
}
