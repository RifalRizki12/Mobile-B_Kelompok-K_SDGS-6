import 'package:flutter/material.dart';
import 'package:project/screen/maps.dart' as hitung;
import 'package:project/screen/clock.dart' as berat;

import 'nav-drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create appBar
      appBar: AppBar(
        //warna background
        backgroundColor: Colors.blue,
        title: new Text("Dashboard"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Beranda",
            ),
            Tab(
              icon: Icon(Icons.alarm),
              text: "alarm",
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: "notification",
            ),
            // Tab(child: Image(image: AssetImage("assets/images/icon1.png"),),)
          ],
        ),
      ),
      drawer: DrawerWidget(),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          // beranda.Beranda(controller),
          hitung.Maps(),
          berat.Clock(),
          // minum.Minum(),
        ],
      ),
    );
  }
}
