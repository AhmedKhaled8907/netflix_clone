import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/core/utils/widgets/movie_item.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';

class MovieItemListView extends StatelessWidget {
  const MovieItemListView({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: AppSize.s16);
      },
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(movie: movies[index]);
      },
    );
  }
}
