import 'package:flutter/material.dart';
import 'package:cinemasync/pages/review-list.dart';
import 'package:cinemasync/pages/review-submit.dart';
import 'package:cinemasync/pages/account-page.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 1,
                    child: ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Review List'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 2,
                    child: ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Review Submit'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 3,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Account'),
                    ),
                  ),
                ],
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewListPage(),
                  ),
                );
              }
              if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewSubmitPage(),
                  ),
                );
              }
              if (value == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ),
                );
              }
            }),
        title: const Text('CinemaSync'),
      ),
      body: const Center(),
    );
  }
}
