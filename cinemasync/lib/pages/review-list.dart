// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:cinemasync/widgets/rating-list.dart';
import 'package:cinemasync/movie-rating.dart';

class ReviewListPage extends StatefulWidget {
  @override
  ReviewListPageState createState() => ReviewListPageState();
}

class ReviewListPageState extends State<ReviewListPage> {
  // Sample movie ratings
  List<MovieRating> movies = [
    MovieRating(movieName: 'Inception', rating: 9),
    MovieRating(movieName: 'The Shawshank Redemption', rating: 10),
    MovieRating(movieName: 'The Godfather', rating: 10),
    // Add more movie ratings here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review List Page'),
      ),
      body: MovieRatingList(movieRatings: movies),
    );
  }
}
