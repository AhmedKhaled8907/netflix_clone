import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMoviesUseCase getSearchMoviesUseCase;

  SearchBloc(
    this.getSearchMoviesUseCase,
  ) : super(SearchInitial()) {
    on<SearchMoviesQueryChanged>(_onSearchMoviesQueryChanged);
    on<ClearSearchResults>(_onClearSearchResults);
  }

  void _onSearchMoviesQueryChanged(
    SearchMoviesQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final result = await getSearchMoviesUseCase(
      SearchMoviesParams(
        query: event.query,
      ),
    );
    result.fold(
      (failure) => emit(
        SearchMoviesError(failure.errMessage),
      ),
      (result) => emit(SearchMoviesSuccess(result)),
    );
  }

  void _onClearSearchResults(
    ClearSearchResults event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchInitial());
  }
}
