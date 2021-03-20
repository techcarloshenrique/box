//import 'package:box/views/onboarding.dart';
import 'package:box/views/onboarding.dart';
import 'package:flutter/material.dart';
//import 'package:box/views/home.dart';

void main() {
  runApp(Box());
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Box Onboarding",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: Onboarding(),
    );
  }
}
