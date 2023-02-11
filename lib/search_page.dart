import 'dart:async';
import 'dart:convert';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waste_management/api_calling.dart';
import 'package:waste_management/messages.dart';

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
        title: const Center(child: Text('your chatbot', style: TextStyle(color: Color.fromARGB(255, 0, 148, 133)),)),
        backgroundColor:  Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(30),
              height: 120.0,
              child: Expanded(
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
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(160, 50),
                        primary: const Color.fromARGB(255, 0, 148, 133),
                        onPrimary: Colors.white),
                        
                    child: const Text('send'),
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
                                style: const TextStyle(color: Colors.white)));
                      }
                      explained = json.decode(code);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                height: 300.0,
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
      ),
    );
  }
}






// class Chatbot {
//   static const API_KEY = "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";
//   static const API_URL = "https://api.dialogflow.com/v1/query?v=20150910";

//   static Future<String> sendMessage(String message) async {
//     final response = await http.post(API_URL,
//         headers: {
//           "Authorization": "Bearer $API_KEY",
//           "Content-Type": "application/json"
//         },
//         body: json.encode({
//           "query": message,
//           "lang": "en",
//           "sessionId": "12345"
//         }));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['result']['fulfillment']['speech'];
//     } else {
//       throw Exception('Failed to get response from chatbot');
//     }
//   }
// }

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   late DialogFlowtter dialogFlowtter;
//   final TextEditingController _controller = TextEditingController();

//   List<Map<String, dynamic>> messages = [];

//   @override
//   void initState() {
//     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: Text('chatbot buddy',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 0, 148, 133),
//                 ))),
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(child: MessagesScreen(messages: messages)),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               color: Color.fromARGB(255, 0, 148, 133),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: TextField(
//                     controller: _controller,
//                     style: const TextStyle(color: Colors.white),
//                   )),
//                   IconButton(
//                       onPressed: () {
//                         sendmessage(_controller.text);
//                         _controller.clear();
//                       },
//                       icon: Icon(Icons.send))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
  //    );
  // }

//   sendmessage(String text) async {
//     if (text.isEmpty) {
//       print("message is empty");
//     } else {
//       setState(() {
//         addMessage(Message(text: DialogText(text: [text])), true);
//       });

//       DetectIntentResponse response = await dialogFlowtter.detectIntent(
//           queryInput: QueryInput(text: TextInput(text: text)));

//       if (response.message == null) return;
//       setState(() {
//         addMessage(response.message!);
//       });
//     }
//   }

//   addMessage(Message message, [bool isUserMessage = false]) {
//     messages.add({'message': message, 'isUserMessag': isUserMessage});
//   }
//  }
// void main() async {
//   String message = "Hello";
//   String response = await Chatbot.sendMessage(message);
//   print(response);
//  }