part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {
  const MovieDetailsState();
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage;
  const MovieDetailsFailure({required this.errMessage});
}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;
  const MovieDetailsSuccess({required this.movie});
}
