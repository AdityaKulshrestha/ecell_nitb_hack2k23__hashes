import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:waste_management/screens/mapscreen.dart';

import 'package:waste_management/screens/reward_page.dart';
import 'package:waste_management/screens/search_page.dart';
import 'package:waste_management/screens/user_dash.dart';

import '../../auth_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int CurrentIndex = 0;

  void onTap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    MapPage(),
    RewardPage(),
    SearchPage(),
    UserDash()
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Your Trash buddy')),
          backgroundColor: const Color.fromARGB(255, 0, 148, 133),
          elevation: 0.0,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    AuthController.instance.logOut();
                  },
                  child: const Icon(
                    Icons.logout_rounded,
                    size: 26.0,
                  ),
                )),
          ]),
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
              icon: Icon(Icons.auto_graph_sharp),
              label: "search",
              backgroundColor: Color.fromARGB(255, 0, 148, 133)),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: "camera",
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
