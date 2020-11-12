import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  TabController controller;
  Beranda(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HALAMAN SATU'),
      ),
    );
  }
}