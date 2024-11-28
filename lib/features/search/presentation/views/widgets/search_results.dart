import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/widgets/movie_item_list_view.dart';
import 'package:netflix_clone/features/search/presentation/controller/search_bloc/search_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(
            child: Text(
              StringManager.anythingYouWant,
              style: StyleManager.styleMedium16(context),
            ),
          );
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchMoviesSuccess) {
          return _buildMoviesList(state.results, context);
        } else if (state is SearchMoviesError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMoviesList(
    List<MovieEntity> results,
    BuildContext context,
  ) {
    if (results.isEmpty) {
      return Center(
        child: Text(
          StringManager.noResultsFound,
          style: StyleManager.styleMedium16(context),
        ),
      );
    }
    return MovieItemListView(movies: results);

    //  ListView.builder(
    //   physics: const BouncingScrollPhysics(),
    //   itemCount: results.length,
    //   itemBuilder: (context, index) {
    //     final searchEntity = results[index];
    //     return InkWell(
    //       onTap: () {
    //         FocusScope.of(context).unfocus();
    //         Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (context) => MovieDetailView(
    //               id: searchEntity.id,
    //             ),
    //           ),
    //         );
    //       },
    //       child: Column(
    //         children: [
    //           SearchResultsItem(
    //             title: searchEntity.title,
    //             posterPath: searchEntity.posterPath,
    //             releaseDate: searchEntity.releaseDate,
    //             voteAverage: searchEntity.voteAverage.toDouble(),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
