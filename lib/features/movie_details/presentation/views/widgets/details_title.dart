import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/font_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: StyleManager.styleBold18(context).copyWith(
        fontSize: FontSize.s24,
      ),
    );
  }
}
