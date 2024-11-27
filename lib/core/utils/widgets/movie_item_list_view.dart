import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/core/utils/widgets/movie_item.dart';

class MovieItemListView extends StatelessWidget {
  const MovieItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: AppSize.s16);
      },
      itemBuilder: (BuildContext context, int index) {
        return const MovieItem();
      },
    );
  }
}

