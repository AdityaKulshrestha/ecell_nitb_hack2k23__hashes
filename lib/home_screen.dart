import 'package:flutter/material.dart';
import 'package:waste_management/dashboard.dart';
import 'package:waste_management/reward_page.dart';
import 'package:waste_management/search_page.dart';
import 'auth_controller.dart';

class home_screen extends StatefulWidget {
  home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List pages = [Reward_page(), SearchPage(), My_page()];

  int CurrentIndex = 0;

  void onTap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Center(child: Text('your Trash buddy')),
          backgroundColor: Color.fromARGB(255, 0, 148, 133),
          elevation: 0,
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
      body: pages[0],
      //  body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       child: Text('WELCOME TO THE APP',
      //           style:
      //               const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 148, 133))),
      //       margin: EdgeInsets.all(50),
      //     ),
      //   ],
      // ),
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
              icon: Icon(Icons.location_on_outlined),
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
