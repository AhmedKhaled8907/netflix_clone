import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: CachedNetworkImage(
                imageUrl: movie.poster ?? '',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSize.s16),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movie.title!,
                style: StyleManager.styleBold18(context),
              ),
              const SizedBox(height: AppPadding.p8),
              Text(
                stripHtmlTags(movie.summary!),
                maxLines: 3,
                style: StyleManager.styleRegular12(context).copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String stripHtmlTags(String htmlText) {
    final RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: false,
    );
    return htmlText.replaceAll(exp, '');
  }
}
