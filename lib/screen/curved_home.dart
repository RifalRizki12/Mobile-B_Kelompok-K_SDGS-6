import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project/screen/beranda.dart';
import 'package:project/screen/berat.dart';
import 'package:project/screen/hitung.dart';
import 'package:project/screen/nav-drawer.dart';

class CurvedHome extends StatefulWidget {
  @override
  _CurvedHomeState createState() => _CurvedHomeState();
}

class _CurvedHomeState extends State<CurvedHome> {
  var _page = 0;
  final pages = [Beranda(), Hitung(), Berat()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: new Text("Dashboard"),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.lightBlueAccent,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInCubic,
        animationDuration: Duration(milliseconds: 200),
        height: 50,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
          ),
          Icon(
            Icons.list,
            size: 20,
          ),
          Icon(
            Icons.notifications,
            size: 20,
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}
