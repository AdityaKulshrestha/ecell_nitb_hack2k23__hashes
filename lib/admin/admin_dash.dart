import 'package:flutter/material.dart';

import '../auth_controller.dart';
import 'admin_insights.dart';

class AdminDashPage extends StatefulWidget {
  AdminDashPage({Key? key}) : super(key: key);

  @override
  State<AdminDashPage> createState() => _AdminDashPageState();
}

class _AdminDashPageState extends State<AdminDashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.insights,
            size: 30,
          ),
          title: const Text(
            'Insights',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
           Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Statistics(
 )));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.account_circle_rounded,
            size: 30,
          ),
          title: const Text(
            'Sign Out',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            AuthController.instance.logOut();
          },
        ),
      ]),
    ));
  }
}
