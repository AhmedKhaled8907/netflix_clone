import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/assets_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8),
            child: Image.asset(
              Assets.imagesRRR,
              fit: BoxFit.fill,
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
                'RRR',
                style: StyleManager.styleBold18(context),
              ),
              const SizedBox(height: AppPadding.p8),
              Text(
                'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                maxLines: 2,
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
}
