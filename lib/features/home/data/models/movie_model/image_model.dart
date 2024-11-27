class ImageModel {
  String? medium;
  String? original;

  ImageModel({this.medium, this.original});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        medium: json['medium'] as String?,
        original: json['original'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'medium': medium,
        'original': original,
      };
}
