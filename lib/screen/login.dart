import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Animation/FadeAnimation.dart';
import 'package:project/screen/auth.dart';
import 'package:project/screen/curved_home.dart';
import 'package:project/screen/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController _email = TextEditingController();
  // TextEditingController _pass = TextEditingController();

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => CurvedHome()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
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
                        "LOGIN",
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
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
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
                                      keyboardType: TextInputType.emailAddress,
                                      controller: username_controller,
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[600]),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: password_controller,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[600]),
                                          border: InputBorder.none),
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey[600]),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          child: FadeAnimation(
                            1.6,
                            RaisedButton(
                              // height: 50,
                              // minWidth: 250,
                              onPressed: () {
                                String username = username_controller.text;
                                String password = password_controller.text;
                                if (username != '' && password != '') {
                                  print('Successfull');
                                  logindata.setBool('login', false);
                                  logindata.setString('username', username);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CurvedHome()));
                                }
                              },
                              // onPressed: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CurvedHome()),
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
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.7,
                            Text(
                              "Or",
                              style: TextStyle(color: Colors.grey[600]),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FadeAnimation(
                            1.8,
                            MaterialButton(
                              height: 50,
                              minWidth: 250,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.blue[300],
                              child: Text(
                                "Register",
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
