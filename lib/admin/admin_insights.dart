import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:waste_management/admin/detail_analysis.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
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
              "Insights       ",
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
                  "Report on daily dump",
                  style: TextStyle(
                      fontSize: 25,
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
                    image: AssetImage("img/images/bargraph.png"),
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
                  "Waste Distribution among wards",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 148, 133)),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: w * 0.8,
                height: w * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("img/images/donutgraph.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => wardAnalysis()),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: w * 0.38,
                  height: h * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 0, 148, 133),
                  ),
                  child: const Center(
                    child: Text(
                      "Ward Analysis",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
