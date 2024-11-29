import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_genres_list_view.dart';

class DetailsGenres extends StatelessWidget {
  const DetailsGenres({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Genres:',
            style:StyleManager.styleMedium16(context),
            ),
        const SizedBox(width: AppSize.s8),
        DetailsGenresListView(genres: genres),
      ],
    );
  }
}
