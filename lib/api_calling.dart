import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "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";
const Header = {
  "content-Type": "application/json",
  "Authorization": 'Bearer $apiKey'
};

String API_URL =
    "https://api.openai.com/v1/engines/text-davinci-003/completions";

Future<String> query4(String prompt) async {
  final response =
      await http.post(Uri.https("api.openai.com", "/v1/completions"),
          headers: Header,
          body: jsonEncode({
            "model": "text-davinci-003",
            "prompt": prompt,
            "temperature": 0,
            "max_tokens": 200,
            'top_p': 1,
            'frequency_penalty': 0.0,
            'presence_penalty': 0.0
          }));
  return response.body;
}
