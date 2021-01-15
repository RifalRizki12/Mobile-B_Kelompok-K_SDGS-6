import 'package:flutter/material.dart';
import 'package:project/screen/clock.dart';

class HomeClock extends StatefulWidget {
  @override
  _HomeClockState createState() => _HomeClockState();
}

class _HomeClockState extends State<HomeClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text('Clock', style: TextStyle(color: Colors.grey, fontSize: 24)),
            Clock(),
          ],
        ),
      ),
    );
  }
}
