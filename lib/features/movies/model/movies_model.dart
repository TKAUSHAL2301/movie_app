
class MovieModel {
  final int id;

  final String title;

  final String overview;

  final String posterPath;

  final String releaseDate;

  final double voteAverage;

  final DateTime? lastVisited;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    this.lastVisited,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      lastVisited: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'vote_average': voteAverage,
        'last_visited': lastVisited?.toIso8601String(),
      };
}
