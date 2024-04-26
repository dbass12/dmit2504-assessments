// ignore_for_file: file_names, unused_import
class MovieRating {
  final String movieName;
  final double rating;

  MovieRating({required this.movieName, required this.rating});

  factory MovieRating.fromJson(Map<String, dynamic> json) {
    return MovieRating(
      movieName: json['movieName'],
      rating: json['rating'],
    );
  }

  @override
  String toString() {
    return 'MovieRating{movieName: $movieName, rating: $rating}';
  }
}
