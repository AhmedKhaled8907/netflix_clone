part of 'search_bloc.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

// Movies Search States
class SearchMoviesSuccess extends SearchState {
  final List<MovieEntity> results;

  const SearchMoviesSuccess(this.results);
}

class SearchMoviesError extends SearchState {
  final String message;

  const SearchMoviesError(this.message);
}
