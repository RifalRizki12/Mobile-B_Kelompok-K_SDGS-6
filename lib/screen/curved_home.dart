import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project/screen/beranda.dart';
import 'package:project/screen/berat.dart';
import 'package:project/screen/maps.dart';
import 'package:project/screen/nav-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurvedHome extends StatefulWidget {
  @override
  _CurvedHomeState createState() => _CurvedHomeState();
}

class _CurvedHomeState extends State<CurvedHome> {
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  var _page = 0;
  final pages = [Beranda(), Maps(), Berat()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: new Text("My Water"),
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
            Icons.map,
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
