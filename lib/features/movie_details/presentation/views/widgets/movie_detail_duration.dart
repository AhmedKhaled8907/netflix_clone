import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class MovieDetailsDuration extends StatelessWidget {
  const MovieDetailsDuration({
    super.key,
    required this.runtime,
  });

  final int runtime;

  @override
  Widget build(BuildContext context) {
    return Text(
      _showDuration(runtime),
      style: const TextStyle(
        // color: Colors.white70,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ AppSize.s60;
    final int minutes = runtime % AppSize.s60.toInt();

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
