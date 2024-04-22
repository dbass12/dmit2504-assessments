import 'package:flutter/material.dart';
import 'package:cinemasync/pages/review-list.dart';
import 'package:cinemasync/pages/review-submit.dart';

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
            }),
        title: const Text('CinemaSync'),
      ),
      body: const Center(),
    );
  }
}
