class MovieEntity {
  final String? title;
  final String? poster;
  final String? summary;
  final int? id;
  final List<String>? genres;
  final int? runtime;
  final String? premiered;

  MovieEntity({
    required this.title,
    required this.poster,
    required this.summary,
    this.id,
    this.genres,
    this.runtime,
    this.premiered,
  });
}
