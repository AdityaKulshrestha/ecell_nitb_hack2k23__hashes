import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management/api_calling.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final codeController = TextEditingController();
  late var code;
  late dynamic explained;
  bool isText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Ask to Trash Buddy',
          style:
              TextStyle(color: Color.fromARGB(255, 0, 148, 133), fontSize: 20),
        )),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: 120.0,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: codeController,
                          decoration: InputDecoration(
                              hintText: "Paste your text here",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(50, 59, 63, 1),
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(50, 59, 63, 1),
                                  width: 1.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(140, 45),
                            primary: const Color.fromARGB(255, 0, 148, 133),
                            onPrimary: Colors.white),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          try {
                            code = await query4(codeController.text);
                            print(code);
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
                                    style:
                                        const TextStyle(color: Colors.white)));
                          }
                          explained = json.decode(code);
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 250.0,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        (isText) ? explained["choices"][0]["text"] : '',
                        style: const TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
