import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: AppSize.s20,
        ),
        const SizedBox(width: AppSize.s4),
        Text(
          (voteAverage).toStringAsFixed(1),
          style:StyleManager.styleMedium16(context),
        ),
      ],
    );
  }
}
