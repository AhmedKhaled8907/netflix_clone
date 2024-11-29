import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/functions/service_locator.dart';
import 'package:netflix_clone/features/movie_details/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(
          GetMovieDetailsEvent(movieId: id),
        ),
      child: const Scaffold(
        body: MovieDetailsViewBody(),
      ),
    );
  }
}
