import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:waste_management/admin/admin_dash.dart';
import 'package:waste_management/admin/admin_map.dart';


import '../auth_controller.dart';


class AHomePage extends StatefulWidget {
  AHomePage({Key? key}) : super(key: key);

  @override
  State<AHomePage> createState() => _AHomePageState();
}

class _AHomePageState extends State<AHomePage> {
  int CurrentIndex = 0;

  void onTap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
   AdminMapPage(),
   AdminDashPage()
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Admin Page')),
          backgroundColor: const Color.fromARGB(255, 0, 148, 133),
          elevation: 0.0,
          // actions: <Widget>[
          //   Padding(
          //       padding: const EdgeInsets.only(right: 20.0),
          //       child: GestureDetector(
          //         onTap: () {
          //           AuthController.instance.logOut();
          //         },
          //         child: const Icon(
          //           Icons.logout_rounded,
          //           size: 26.0,
          //         ),
          //       )),
          // ]
          ),
      body: Center(
        child: _widgetOptions.elementAt(CurrentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: CurrentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 0, 148, 133)),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: "dashboard",
              backgroundColor: Color.fromARGB(255, 0, 148, 133))
        ],
      ),
    );
  }
}
