import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class DetailsDateRelease extends StatelessWidget {
  const DetailsDateRelease({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p4,
        horizontal: AppSize.s8,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      child: Text(
        releaseDate.split('-')[0],
        style: StyleManager.styleMedium16(context),
      ),
    );
  }
}
