// // ignore_for_file: use_key_in_widget_constructors, avoid_print, file_names
import 'package:cinemasync/services/authorization.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  @override
  LogoutPageState createState() => LogoutPageState();
}

class LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Review List Page'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    await Authorization().logOut();
                  },
                  child: const Text("Log Out"),
                )
              ]),
        ));
  }
}
