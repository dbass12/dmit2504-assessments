// ignore_for_file: use_key_in_widget_constructors, todo

import 'package:flutter/material.dart';
import 'dart:math';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

//This app makes use of the Row, Column,
//Expanded, Padding, Transform, Container,
//BoxDecoration, BoxShape, Colors,
//Border, Center, Align, Alignment,
//EdgeInsets, Text, and TextStyle Widgets
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          // ***REMOVED CONST TO FIX ERROR***
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //TODO: Put your code here to complete this app.
            Column(children: <Widget>[
              // Col1
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: const Center(
                  child: Text(
                    'Container 1',
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 4,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Container 2',
                    ),
                  ),
                ),
              )
            ]),
            Column(children: <Widget>[
              // Col2
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.yellow,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Container 3',
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Container 4',
                    ),
                  ),
                ),
              )),
            ]),
            Column(children: <Widget>[
              // Col3
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Center(
                  child: Text(
                    'Container 5',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Con 6',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
