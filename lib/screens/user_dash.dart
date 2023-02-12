import 'package:flutter/material.dart';

import '../../auth_controller.dart';
import 'yt_videos.dart';

class UserDash extends StatefulWidget {
  UserDash({Key? key}) : super(key: key);

  @override
  State<UserDash> createState() => _UserDashState();
}

class _UserDashState extends State<UserDash> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(children: [
        const SizedBox(
              height: 20,
            ),
        ListTile(
          leading: const Icon(Icons.explore,size: 30,),
          title: const Text('Explore',style: TextStyle(fontSize: 20),),
          onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyPage(
                          
                        )));
          },
        ),
        const SizedBox(
              height: 20,
            ),
        ListTile(
          leading: const Icon(Icons.account_circle_rounded,size: 30,),
          title: const Text('Sign Out',style: TextStyle(fontSize: 20),),
          onTap: () {
            AuthController.instance.logOut();
          },
        ),
      ]),
    ));;
  }
}