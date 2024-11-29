import 'package:netflix_clone/core/movies/domain/entity/movie_entity.dart';

class Show extends MovieEntity {
  @override
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  @override
  List<String>? genres;
  String? status;
  @override
  int? runtime;
  @override
  String? premiered;
  @override
  String? summary;
  String? image;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.premiered,
    required this.image,
    required this.summary,
  }) : super(
          title: name ?? 'unknown',
          poster: image ?? '',
          summary: summary ?? 'there is no summary',
          id: id ?? 0,
          premiered: premiered ?? 'unknown',
          genres: genres ?? [],
          runtime: runtime ?? 0,
        );

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int,
      url: json['url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      runtime: json['runtime'] as int? ?? 0,
      premiered: json['premiered'] as String?,
      summary: json['summary'] as String?,
      image: json['image'] != null ? json['image']['medium'] : null,
    );
  }
}
