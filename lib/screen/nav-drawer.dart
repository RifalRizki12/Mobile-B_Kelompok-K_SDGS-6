import 'package:flutter/material.dart';
import 'package:project/componenDrawer/about.dart';
import 'package:project/componenDrawer/profile.dart';
import 'package:project/componenDrawer/setting.dart';
import 'package:project/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }),
          _drawerItem(
              icon: Icons.android,
              text: 'About',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              }),
          // _drawerItem(
          //     icon: Icons.access_time,
          //     text: 'Recent',
          //     onTap: () {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => Login()));
          //     }),
          // _drawerItem(
          //     icon: Icons.delete,
          //     text: 'Trash',
          //     onTap: () {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => Login()));
          //     }),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.settings,
              text: 'Setting',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              }),
          _drawerItem(
              icon: Icons.input,
              text: 'LogOut',
              onTap: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => Login()));
              }),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
        image: AssetImage('assets/images/icon1.png'),
        fit: BoxFit.cover,
      ),
    ),
    accountName: Text('Profile Name'),
    accountEmail: Text(''),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
