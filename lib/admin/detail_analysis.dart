import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class wardAnalysis extends StatefulWidget {
  const wardAnalysis({super.key});

  @override
  State<wardAnalysis> createState() => _wardAnalysisState();
}

class _wardAnalysisState extends State<wardAnalysis> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 148, 133),
          // automaticallyImplyLeading: true,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_outlined),
          //   onPressed: () => Navigator.pop(context, false),
          // ),
          title: const Center(
            child: Text(
              "Ward Analysis        ",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 1",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 2",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/3.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 3",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/4.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 4",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/5.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 5",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/6.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 6",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/7.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 7",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/8.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.04,
                margin: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                  "ward 8",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/9.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
