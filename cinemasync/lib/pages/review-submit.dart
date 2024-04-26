// ignore_for_file: file_names, unused_import
import 'package:cinemasync/movie-rating.dart';
import 'package:flutter/material.dart';
import 'package:cinemasync/widgets/rating-form.dart';
import 'package:cinemasync/services/ratings-db.dart';
import 'package:cinemasync/services/authorization.dart';
import 'package:cinemasync/pages/login.dart';

class ReviewSubmitPage extends StatefulWidget {
  @override
  ReviewSubmitPageState createState() => ReviewSubmitPageState();
}

class ReviewSubmitPageState extends State<ReviewSubmitPage> {
  // Sample movie names
  List<String> movieNames = [
    'Dunkirk',
    'Inception',
    'Interstellar',
    'Oppenheimer',
    'Tenet'
    // Add more movie names here...
  ];

  @override
  Widget build(BuildContext context) {
    if (Authorization().currentUser == null) {
      return Login();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Submission'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RatingForm(
            movieNames: movieNames,
            onSubmit: (ratings) {
              // Handle the submitted ratings
              // For example, you can send them to a server or update local storage
              print(ratings);
              List<MovieRating> ratingsList = [
                MovieRating(movieName: 'Dunkirk', rating: ratings[0]),
                MovieRating(movieName: 'Inception', rating: ratings[1]),
                MovieRating(movieName: 'Interstellar', rating: ratings[2]),
                MovieRating(movieName: 'Oppenheimer', rating: ratings[3]),
                MovieRating(movieName: 'Tenet', rating: ratings[4]),
              ];
              RatingsDB.addMovieRatings(ratingsList);
            },
          ),
        ),
      ),
    );
  }
}
