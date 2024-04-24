// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:cinemasync/widgets/rating-form.dart';

class ReviewSubmitPage extends StatefulWidget {
  @override
  ReviewSubmitPageState createState() => ReviewSubmitPageState();
}

class ReviewSubmitPageState extends State<ReviewSubmitPage> {
  // Sample movie names
  List<String> movieNames = [
    'Inception',
    'The Shawshank Redemption',
    'The Godfather',
    // Add more movie names here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Submit Page'),
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
            },
          ),
        ),
      ),
    );
  }
}
