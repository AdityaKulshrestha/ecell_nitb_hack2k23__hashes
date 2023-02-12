import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const API_URL = "https://api-inference.huggingface.co/models/Aalaa/Fine_tuned_Vit_trash_classification";
const headers = {"Authorization": "Bearer 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"};

Future<String> query(String filename) async {
  final data = await File(filename).readAsBytes();
  
  // var data = await rootBundle.load(filename);
  var response = await http.post(Uri.parse(API_URL), headers: headers, body: data);
  return response.body;
}