import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../api_calling2.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  var _image;
  var image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: _image == null
              ? const Text("No Image selected")
              : Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: h * 0.9, width: w, child: Image.file(_image)),
                  ElevatedButton(
                      onPressed: () {
                        if (_image != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  WSPage(input: image!.path)));
                        } else {
                          Get.snackbar("about User", "user message",
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                              titleText: const Text(
                                "Task Failed",
                                style: TextStyle(color: Colors.white),
                              ),
                              messageText: const Text('Take photo first',
                                  style: TextStyle(color: Colors.white)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 148, 133)),
                      child: const Text('Predict',
                          style: TextStyle(color: Colors.white))),
                ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 148, 133),
        onPressed: getImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
