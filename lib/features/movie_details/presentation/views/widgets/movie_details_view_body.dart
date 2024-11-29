import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/movie_details/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:netflix_clone/features/movie_details/presentation/views/widgets/movie_details_item.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is MovieDetailsLoading) {
          const CircularProgressIndicator(
            color: Colors.white,
          );
        }
      },
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return MovieDetailsItem(movie: state.movie);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
