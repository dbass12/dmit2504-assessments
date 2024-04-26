// ignore_for_file: file_names, unused_import
import 'package:cinemasync/themes/colorScheme.dart';
import 'package:flutter/material.dart';
import 'package:cinemasync/services/ratings-db.dart';
import 'package:cinemasync/movie-rating.dart';

class RatingForm extends StatefulWidget {
  final List<String> movieNames;
  final Function(List<double>) onSubmit;

  RatingForm({required this.movieNames, required this.onSubmit});

  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  late List<TextEditingController> controllers;
  late List<double> ratings = List.filled(5,
      0.0); // Assuming there are 5 movies initially and default rating is 0.0

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.movieNames.length,
      (index) => TextEditingController(text: ''),
    );

    // Call the getMovieRatings method to populate the ratings list
    getMovieRatings();
  }

  Future<void> getMovieRatings() async {
    try {
      List<double> fetchedRatings = await RatingsDB.getMovieRatings();
      if (fetchedRatings.length <= 4) {
        fetchedRatings = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
      }
      setState(() {
        ratings = fetchedRatings;

        // Assign ratings to text controllers
        for (int i = 0; i < fetchedRatings.length; i++) {
          controllers[i].text = fetchedRatings[i].toString();
        }
      });
    } catch (error) {
      print('error in rating-form: getMovieRatings(): $error');
      // Handle error
    }
  }

  double getRatingForMovie(List<MovieRating> movieRatings, String movieName) {
    // Iterate over the list of MovieRating objects
    for (MovieRating rating in movieRatings) {
      // Check if the movieName matches the desired movie
      if (rating.movieName == movieName) {
        // Return the rating for the movie
        return rating.rating;
      }
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < widget.movieNames.length; i++)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(widget.movieNames[i]),
                  ),
                  const SizedBox(width: 20.0),
                  SizedBox(
                    width: 85.0, // Adjust the width as needed
                    child: TextFormField(
                      controller: controllers[i],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: colorScheme.onBackground),
                      ),
                      onChanged: (value) {
                        setState(() {
                          ratings[i] = double.tryParse(value) ?? 0.0;
                          print(ratings);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(ratings);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
