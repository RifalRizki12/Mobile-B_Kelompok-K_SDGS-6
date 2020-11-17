import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  // TabController controller;
  // Beranda(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 3),
                  prefixIcon: Padding(
                    padding:
                    const EdgeInsets.only(left: 25,right: 25),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 1.0, color: Colors.grey[400],
                    )
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}