// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:cinemasync/pages/logout.dart';
import 'package:flutter/material.dart';
import 'package:cinemasync/services/authorization.dart';
import 'package:cinemasync/pages/login.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(
        'First build: Current User = ${Authorization().currentUser?.displayName}');
    Authorization().listen();
    if (Authorization().currentUser == null) {
      return Login();
    } else {
      return LogoutPage();
    }
  }
}
