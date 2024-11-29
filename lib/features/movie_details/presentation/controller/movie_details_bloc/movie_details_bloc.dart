import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());

    final result = await getMovieDetailsUseCase(
      MovieDetailsParams(id: event.movieId),
    );
    result.fold(
      (l) => emit(
        MovieDetailsFailure(errMessage: l.errMessage),
      ),
      (movie) => emit(
        MovieDetailsSuccess(movie: movie),
      ),
    );
  }
}
