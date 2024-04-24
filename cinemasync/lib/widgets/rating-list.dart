// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:cinemasync/movie-rating.dart';

class MovieRatingList extends StatelessWidget {
  final List<MovieRating> movieRatings;

  MovieRatingList({required this.movieRatings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieRatings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movieRatings[index].movieName),
          subtitle: Text('Rating: ${movieRatings[index].rating.toString()}'),
        );
      },
    );
  }
}
