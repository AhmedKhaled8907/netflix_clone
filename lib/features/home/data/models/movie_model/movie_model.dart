import 'package:netflix_clone/features/home/domain/entity/movie_entity.dart';

import 'show.dart';

class MovieModel extends MovieEntity {
  double? score;
  Show? show;

  MovieModel({this.score, this.show})
      : super(
          title: show!.name,
          poster: show.image!.original,
          summary: show.summary,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        score: (json['score'] as num?)?.toDouble(),
        show: json['show'] == null
            ? null
            : Show.fromJson(json['show'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'score': score,
        'show': show?.toJson(),
      };
}
