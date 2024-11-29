import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';
import 'package:netflix_clone/core/utils/managers/assets_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_app_bar.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_date_release.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_genres.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_over_view.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_rating.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/details_title.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/movie_detail_duration.dart';

class MovieDetailsItem extends StatelessWidget {
  const MovieDetailsItem({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailsAppBar(
              poster: movie.poster,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesBell,
                        fit: BoxFit.fill,
                        width: 32,
                      ),
                      const SizedBox(height: AppSize.s4),
                      Text(
                        'Remind me',
                        style: StyleManager.styleMedium12(context),
                      )
                    ],
                  ),
                  const SizedBox(width: AppSize.s40),
                  Column(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesShare,
                        fit: BoxFit.fill,
                        width: 32,
                      ),
                      const SizedBox(height: AppSize.s4),
                      Text(
                        'Share',
                        style: StyleManager.styleMedium12(context),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsTitle(
                    title: movie.title ?? '',
                  ),
                  const SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      DetailsDateRelease(
                        releaseDate: movie.premiered ?? '',
                      ),
                      const SizedBox(width: AppSize.s16),
                      const Rating(
                        voteAverage: 1.2,
                      ),
                      const SizedBox(width: AppSize.s16),
                      MovieDetailsDuration(
                        runtime: movie.runtime ?? 0,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s16),
                  DetailsOverView(
                    overview: movie.summary ?? '',
                  ),
                  const SizedBox(height: AppSize.s16),
                  DetailsGenres(genres: movie.genres ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //  Column(
    //   children: [
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         AspectRatio(
    //           aspectRatio: 1.2,
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(AppSize.s8),
    //             child: CachedNetworkImage(
    //               imageUrl:
    //                   'https://static.tvmaze.com/uploads/images/original_untouched/425/1064746.jpg',
    //               // movie.poster ?? '',
    //               fit: BoxFit.fill, width: double.infinity,
    //               errorWidget: (context, url, error) => const Icon(
    //                 Icons.error,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         SvgPicture.asset(
    //           Assets.imagesBell,
    //           fit: BoxFit.fill,
    //         ),
    //         const SizedBox(width: AppSize.s16),
    //         SvgPicture.asset(
    //           Assets.imagesShare,
    //           fit: BoxFit.fill,
    //         ),
    //       ],
    //     ),
    //     // Expanded(
    //     //   flex: 1,
    //     //   child: Column(
    //     //     crossAxisAlignment: CrossAxisAlignment.start,
    //     //     mainAxisAlignment: MainAxisAlignment.start,
    //     //     children: [
    //     //       Text(
    //     //         'movie.title!',
    //     //         style: StyleManager.styleBold18(context),
    //     //       ),
    //     //       const SizedBox(height: AppPadding.p8),
    //     //       Text(
    //     //         stripHtmlTags(
    //     //             'asdasdasdassssssssssssssssssssssasdasdasdasdmovie.summary ?? '
    //     //             ''),
    //     //         maxLines: 3,
    //     //         style: StyleManager.styleRegular12(context).copyWith(
    //     //           overflow: TextOverflow.ellipsis,
    //     //         ),
    //     //       ),
    //     //     ],
    //     //   ),
    //     // )
    //   ],
    // );
  }
}
