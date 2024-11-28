part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchMoviesQueryChanged extends SearchEvent {
  final String query;

  const SearchMoviesQueryChanged({required this.query});
}

class SearchTvsQueryChanged extends SearchEvent {
  final String query;

  const SearchTvsQueryChanged({required this.query});
}

class ClearSearchResults extends SearchEvent {}
