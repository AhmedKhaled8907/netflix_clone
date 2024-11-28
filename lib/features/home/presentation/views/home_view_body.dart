import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/core/utils/widgets/movie_item_list_view.dart';
import 'package:netflix_clone/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p20,
      ),
      child: BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {
          if (state is MovieLoading) {
            // Show loading indicator
          }
          if (state is MovieFailure) {
            // Show error message
          }
        },
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is MovieSuccess) {
            if (state.movies.isEmpty) {
              return const Center(child: Text('No movies available.'));
            }
            return MovieItemListView(movies: state.movies);
          }
          return Container();
        },
      ),
    );
  }
}
