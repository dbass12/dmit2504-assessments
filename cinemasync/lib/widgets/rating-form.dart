// ignore_for_file: file_names, unused_import
import 'package:cinemasync/themes/colorScheme.dart';
import 'package:flutter/material.dart';

class RatingForm extends StatefulWidget {
  final List<String> movieNames;
  final Function(List<double>) onSubmit;

  RatingForm({required this.movieNames, required this.onSubmit});

  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  late List<TextEditingController> controllers;
  late List<double> ratings;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.movieNames.length,
      (index) => TextEditingController(),
    );
    ratings = List.filled(widget.movieNames.length, 0.0);
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
                    width: 60.0, // Adjust the width as needed
                    child: TextFormField(
                      controller: controllers[i],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: colorScheme.onBackground),
                      ),
                      onChanged: (value) {
                        setState(() {
                          ratings[i] = double.tryParse(value) ?? 0.0;
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
