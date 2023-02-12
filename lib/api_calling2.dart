import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WSPage extends StatefulWidget {
  String input;
  WSPage({Key? key, required this.input}) : super(key: key);
  @override
  _WSPageState createState() => _WSPageState();
}

class _WSPageState extends State<WSPage> {
  String _predictionJson = 'Predicting...';
  

  @override
  void initState() {
    super.initState();
    _predictImage();
  }

Future<void> _predictImage() async {
  String imagePath = widget.input;
  final response = await http.post(Uri.parse("https://keremberke-garbage-object-detection.hf.space/run/predict"),
      headers: {"Content-Type": "multipart/form-data"},
      body: json.encode({
        "data": [
          "data:$imagePath;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACklEQVR4nGMAAQAABQABDQottAAAAABJRU5ErkJggg==",
          0.25,
          "keremberke/yolov5n-garbage",
        ]
      })).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        });

  // print(response);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _predictionJson = response.body;
  //     });
  //   } else {
  //     setState(() {
  //       _predictionJson = 'Failed to predict image';
  //     });
  //   }

  // Future<void> _predictImage() async {
  //   String apiKey = "w6xJcseDTjohUB0FwFwL";
  //   String projectName = "garbage-classification-3";
  //   int version = 2;
  //   String imagePath = widget.input;
  //   int confidence = 40;
  //   int overlap = 30;
  //   final imageBytes = await File(imagePath).readAsBytes();
  //   final imageBase64 = base64Encode(imageBytes);
  //   print(imagePath);

  //   final response = await http.post(
  //       Uri.parse(
  //           'https://detect.roboflow.com/$projectName/$version?api_key=$apiKey&name=$imagePath'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/x-www-form-urlencoded',
        
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'confidence': confidence,
  //         'overlap': overlap,
  //         'base64_image': imageBase64,
  //       }));
  //   print(response);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _predictionJson = response.body;
  //     });
  //   } else {
  //     setState(() {
  //       _predictionJson = 'Failed to predict image';
  //     });
  //   }
  }

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
          child: Text(_predictionJson),
        ),
      ),
    );
  }
}