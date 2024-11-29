import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';

class DetailsOverView extends StatelessWidget {
  const DetailsOverView({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stripHtmlTags(overview),
          style: StyleManager.styleMedium16(context),
        ),
      ],
    );
  }

    String stripHtmlTags(String htmlText) {
    final RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: false,
    );
    return htmlText.replaceAll(exp, '');
  }
}
