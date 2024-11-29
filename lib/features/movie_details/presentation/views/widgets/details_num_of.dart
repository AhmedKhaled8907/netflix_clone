import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';

class DetailsNumOf extends StatelessWidget {
  const DetailsNumOf({
    super.key,
    required this.title,
    required this.numOf,
  });

  final String title;
  final String numOf;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title:  $numOf',
      style: StyleManager.styleMedium16(context),
    );
  }
}
