import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Reward_page extends StatefulWidget {
  const Reward_page({super.key});

  @override
  State<Reward_page> createState() => _Reward_pageState();
}

class _Reward_pageState extends State<Reward_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 148, 133)),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(left: 20, top: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('img/images/tushar.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text(
                      "Tushar Sharma",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
