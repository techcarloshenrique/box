//import 'package:box/views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:box/views/home.dart';

void main() {
  // PUT CONTENT(CONFIG) HERE TO WORK IN ALL PAGES IN MAIN.DART
  runApp(Box());
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: "Box Onboarding Main",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: Home(),
    );
  }
}
