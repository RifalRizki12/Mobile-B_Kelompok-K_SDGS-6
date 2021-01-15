import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constrant.dart';
import 'package:project/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Splash Screen & Login Page"),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: Splashscreen(),
    );
  }
}
