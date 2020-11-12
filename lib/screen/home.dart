import 'package:flutter/material.dart';
import 'package:project/screen/beranda.dart' as beranda;
import 'package:project/screen/hitung.dart' as hitung;
import 'package:project/screen/berat.dart' as berat;
import 'package:project/screen/minum.dart' as minum;

import 'nav-drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.alarm),),
            Tab(icon: Icon(Icons.alarm),),
            Tab(icon: Icon(Icons.alarm),),
          ],
        ),
      ),
      drawer: DrawerWidget(),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          beranda.Beranda(controller),
          hitung.Hitung(),
          berat.Berat(),
          minum.Minum(),
        ],
      ),
    );
  }
}