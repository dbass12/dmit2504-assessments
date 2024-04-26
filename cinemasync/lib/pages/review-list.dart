// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:cinemasync/widgets/rating-list.dart';
import 'package:cinemasync/movie-rating.dart';
import 'package:cinemasync/services/ratings-db.dart';

class ReviewListPage extends StatefulWidget {
  @override
  ReviewListPageState createState() => ReviewListPageState();
}

class ReviewListPageState extends State<ReviewListPage> {
  // Sample movie ratings
  List<MovieRating> movies = [];

  @override
  void initState() {
    super.initState();
    // Call the read function to fetch movie ratings asynchronously
    fetchMovieRatings();
  }

  // Function to fetch movie ratings asynchronously
  Future<void> fetchMovieRatings() async {
    try {
      // Call the read function to fetch movie ratings asynchronously
      List<double> fetchedRatings = await RatingsDB.getAverageRatings();
      List<MovieRating> fetchedMovies = [
        MovieRating(movieName: 'Dunkirk', rating: fetchedRatings[0]),
        MovieRating(movieName: 'Inception', rating: fetchedRatings[1]),
        MovieRating(movieName: 'Interstellar', rating: fetchedRatings[2]),
        MovieRating(movieName: 'Oppenheimer', rating: fetchedRatings[3]),
        MovieRating(movieName: 'Tenet', rating: fetchedRatings[4]),
      ];
      setState(() {
        movies = fetchedMovies;
      });
    } catch (error) {
      print(error);
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review List'),
      ),
      body: MovieRatingList(movieRatings: movies),
    );
  }
}
