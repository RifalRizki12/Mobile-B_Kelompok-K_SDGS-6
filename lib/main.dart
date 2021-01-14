import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constrant.dart';
import 'package:project/screen/auth.dart';
import 'package:project/screen/login.dart';
import 'package:project/splashscreen.dart';
import 'package:project/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: [
//       ChangeNotifierProvider.value(value: Authentication())
//     ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Login()));
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Splash Screen & Login Page"),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: Splashscreen(),
    );
  }
}
