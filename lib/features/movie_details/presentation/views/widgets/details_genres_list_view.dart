// ignore: file_names
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_genres_item.dart';

class DetailsGenresListView extends StatelessWidget {
  const DetailsGenresListView({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: AppSize.s40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              child: DetailsGenresItem(
                genre: genres[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
