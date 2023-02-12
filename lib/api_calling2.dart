import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'api_calling2.dart';
import 'api_calling3.dart';

class WSPage extends StatefulWidget {
  String input;
  WSPage({Key? key, required this.input}) : super(key: key);
  @override
  _WSPageState createState() => _WSPageState();
}

class _WSPageState extends State<WSPage> {
  var isText = false;
  var output;
  var data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 148, 133),
          title: const Text('Roboflow Prediction'),
        ),
        body: Center(
          child: isText
              ? Text(
                  (data[0] == null)
                      ? "Try Again!"
                      : "This trash is ${data[0]["label"]}",
                  style: TextStyle(fontSize: 30),
                )
              : ElevatedButton(
                  onPressed: () async {
                    try {
                      output = await query(widget.input);
                      print(output);
                      isText = true;
                    } catch (e) {
                      isText = false;
                      Get.snackbar("about User", "user message",
                          backgroundColor: Colors.redAccent,
                          snackPosition: SnackPosition.BOTTOM,
                          titleText: const Text(
                            "Failed! Try again",
                            style: TextStyle(color: Colors.white),
                          ),
                          messageText: Text(e.toString(),
                              style: const TextStyle(color: Colors.white)));
                    }
                    data = json.decode(output);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 148, 133)),
                  child: const Text('Predict',
                      style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
