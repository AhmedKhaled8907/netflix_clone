class Rating {
  int? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json['average'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'average': average,
      };
}
