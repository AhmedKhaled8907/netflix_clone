class Externals {
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json['tvrage'] as dynamic,
        thetvdb: json['thetvdb'] as int?,
        imdb: json['imdb'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tvrage': tvrage,
        'thetvdb': thetvdb,
        'imdb': imdb,
      };
}
