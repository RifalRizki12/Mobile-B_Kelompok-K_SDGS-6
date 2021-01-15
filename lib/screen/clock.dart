import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ClockView(),
      ),
    );
  }
}

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(50),
            width: 300,
            height: 300,
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                painter: ClockPainter(),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Alarm',
            child: Icon(Icons.alarm),
            backgroundColor: Colors.blue[400],
          ),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Colors.grey[600];

    var secHandBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    // var dashBrush = Paint()
    //   ..color = Colors.grey[600]
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 10, fillBrush);
    canvas.drawCircle(center, radius - 10, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    // var outerCircleRadius = radius;
    // var innerCircleRadius = radius - 14;
    // for (double i = 0; i < 360; i += 12) {
    //   var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
    //   var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

    //   var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
    //   var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}