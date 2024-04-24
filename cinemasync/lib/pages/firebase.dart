// // ignore_for_file: use_key_in_widget_constructors, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:cinemasync/services/ratings-db.dart';

class FireBasePage extends StatefulWidget {
  @override
  FireBasePageState createState() => FireBasePageState();
}

class FireBasePageState extends State<FireBasePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await RatingsDB().create();
              },
              child: const Text("Create"),
            ),
            ElevatedButton(
              onPressed: () async {
                await RatingsDB().read();
              },
              child: const Text("Read"),
            ),
          ]),
    );
  }
}
