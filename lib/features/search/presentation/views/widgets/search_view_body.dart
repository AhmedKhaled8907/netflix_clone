import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/font_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/search/presentation/views/widgets/search_bar_items.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        // horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarItems(),
          const SizedBox(height: AppPadding.p20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: Text(
              StringManager.topSearch,
              style: StyleManager.styleBold18(context).copyWith(
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: AppPadding.p20),
        ],
      ),
    );
  }
}
