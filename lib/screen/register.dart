import 'package:flutter/material.dart';
import 'package:project/Animation/FadeAnimation.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  String _jk = "";
  void _pilihjk(String value) {
    setState(() {
      _jk = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue[300],
          Colors.blue[200],
          Colors.blue[100]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Nama Pengguna",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[600]),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        hintText: "Moto Hidup",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.6,
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Text(
                                    "Pilih Kelamin",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  RadioListTile(
                                    value: "Laki-laki",
                                    title: Text("Laki-laki"),
                                    groupValue: _jk,
                                    onChanged: (value) {
                                      _pilihjk(value);
                                    },
                                    activeColor: Colors.red,
                                    subtitle:
                                        Text("Pilih ini jika anda laki-laki"),
                                  ),
                                  RadioListTile(
                                    value: "Perempuan",
                                    title: Text("Perempuan"),
                                    groupValue: _jk,
                                    onChanged: (value) {
                                      _pilihjk(value);
                                    },
                                    activeColor: Colors.red,
                                    subtitle:
                                        Text("Pilih ini jika anda perempuan"),
                                  )
                                ],
                              )),
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
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Register()),
                                // );
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.blue[300],
                              child: Text(
                                "Buat Akun",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
