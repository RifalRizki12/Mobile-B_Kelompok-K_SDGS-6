import 'dart:io';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Animation/FadeAnimation.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  //camera and gallery
  File _image;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      // ignore: deprecated_member_use
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      // ignore: deprecated_member_use
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  //floating Action button
  int index = 0;

  // Widget exampleOne() {
  //   return Container(
  //     child: FloatingActionButton(
  //       onPressed: () {
  //         setState(() {
  //           index = index + 1;
  //         });
  //       },
  //       focusColor: Colors.yellow,
  //       focusElevation: 16.0,
  //       heroTag: 'add',
  //       elevation: 2.0,
  //       child: Icon(
  //         Icons.add,
  //         color: Colors.black,
  //       ),
  //     ),
  //   );
  // }

  Widget exampleTwo() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          getImage(false);
          setState(() {
            index = index + 1;
          });
        },
        focusElevation: 16.0,
        focusColor: Colors.yellow,
        heroTag: 'anything',
        elevation: 2.0,
        child: Icon(
          Icons.insert_drive_file,
          color: Colors.black,
        ),
        // _image == null? Container() : Image.file(_image, height:300.0, width: 300.0,),
      ),
    );
  }

  Widget exampleThree() {
    return Container(
        child: FloatingActionButton(
      onPressed: () {
        getImage(true);
        setState(() {
          index = index + 1;
        });
      },
      focusColor: Colors.yellow,
      focusElevation: 16.0,
      elevation: 2.0,
      heroTag: 'see',
      child: Icon(
        Icons.camera_alt,
        color: Colors.black,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: new Text("Upload"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _image == null
              ? Container()
              : Image.file(
                  _image,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Judul",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "Content",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: FadeAnimation(
                    1.8,
                    MaterialButton(
                      height: 50,
                      minWidth: 250,
                      onPressed: () async {
                      },
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Register()),
                      //   );
                      // },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.blue[300],
                      child: Text(
                        "Posting",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        colorEndAnimation: Colors.red,
        colorStartAnimation: Colors.blue,
        animatedIconData: AnimatedIcons.menu_home,
        fabButtons: <Widget>[
          // exampleOne(),
          exampleTwo(),
          exampleThree(),
        ],
      ),
    );
  }
}
