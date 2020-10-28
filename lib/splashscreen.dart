import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Animation/FadeAnimation.dart';
import 'screen/login.dart';

class Splashscreen extends StatefulWidget {
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeAnimation(
              1,
              Image.asset(
                "assets/images/loogo.png",
                // width: 100.0,
                // height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
