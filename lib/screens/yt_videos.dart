import 'package:flutter/material.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      throw 'Could not launch $url';
    }
  }
Future<void>? _launched;  
String toLaunch2 = 'https://youtu.be/rTT-3wMpstI';
String toLaunch1 = 'https://youtu.be/-MS8vfcTmSM';
String toLaunch3 = 'https://youtu.be/r-q5V6LDxEY';
String toLaunch4 = 'https://youtu.be/1-tS7JH4Jyw';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
        GestureDetector(
            onTap: () {setState(() {  
                _launched = _launchInBrowser(toLaunch1);  
              });  },
            child: Image.network(
              YoutubeThumbnail(youtubeId: 'rTT-3wMpstI').standard(),
            )),
        GestureDetector(
            onTap: () {setState(() {  
                _launched = _launchInBrowser(toLaunch2);  
              }); },
            child: Image.network(
              YoutubeThumbnail(youtubeId: '-MS8vfcTmSM').standard(),
            )),
        GestureDetector(
            onTap: () {setState(() {  
                _launched = _launchInBrowser(toLaunch3);  
              }); },
            child: Image.network(
              YoutubeThumbnail(youtubeId: 'r-q5V6LDxEY').standard(),
            )),
        GestureDetector(
            onTap: () {setState(() {  
                _launched = _launchInBrowser(toLaunch4);  
              }); },
            child: Image.network(
              YoutubeThumbnail(youtubeId: '1-tS7JH4Jyw').standard(),
            )),
      ]),
    );
  }
}