import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/core/utils/widgets/movie_item_list_view.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p16,
      ),
      child: MovieItemListView(),
    );
  }
}

