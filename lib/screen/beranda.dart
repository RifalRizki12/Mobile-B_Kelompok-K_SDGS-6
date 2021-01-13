import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:project/screen/upload.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  //floating Action button
  int index = 0;

  Widget exampleOne() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index + 1;
          });
        },
        focusColor: Colors.yellow,
        focusElevation: 16.0,
        heroTag: 'add',
        elevation: 2.0,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget exampleTwo() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          // getImage(false);
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Upload()),
        );
        // getImage(true);
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

  // Title List Here
  var titleList = [
    "Success",
    "Motivation",
  ];

  // Description List Here
  var descList = [
    "Push yourself, because no one else is going to do it for you.Push yourself, because no one else is going to do it for you.Push yourself, because no one else is going to do it for you.Push yourself, because no one else is going to do it for you.Push yourself, because no one else is going to do it for me.",
    "Your limitation—it's only your imagination.",
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/avatar.png",
    "assets/images/loogo.png",
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        colorEndAnimation: Colors.red,
        colorStartAnimation: Colors.blue,
        animatedIconData: AnimatedIcons.menu_home,
        fabButtons: <Widget>[
          exampleOne(),
          exampleTwo(),
          exampleThree(),
        ],
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 650,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      // maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
