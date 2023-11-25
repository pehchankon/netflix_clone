class Movie {
  final int id;
  final String name;
  final PosterImage? image;
  final String? summary;

  const Movie({
    required this.id,
    required this.name,
    this.image,
    required this.summary,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      name: json['name'] as String,
      summary: json['summary'] as String?,
      image: json['image'] != null ? PosterImage.fromJson(json['image']) : null,
    );
  }
}

class PosterImage {
  final String medium;
  final String original;

  const PosterImage({
    required this.medium,
    required this.original,
  });

  factory PosterImage.fromJson(Map<String, dynamic> json) {
    return PosterImage(
      medium: json['medium'] as String,
      original: json['original'] as String,
    );
  }
}
