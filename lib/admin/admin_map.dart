import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'dart:convert';

class AdminMapPage extends StatefulWidget {
  AdminMapPage({Key? key}) : super(key: key);

  @override
  State<AdminMapPage> createState() => _AdminMapPageState();
}

class _AdminMapPageState extends State<AdminMapPage> {
  var userLat = [];
  var userLong = [];
  var i = 0;
  var userLoc = [];
  var address = [];
  // var isButton=false;

  final firestoreInstance = FirebaseFirestore.instance;

  userlocfun() async {
    print("shiv2");
    try {
      var querySnapshot = await firestoreInstance.collection("Users").get();

      querySnapshot.docs.forEach((doc) async {
        var data = doc.data();
        print(doc.data());
        if (data["lat"] != null) {
          print(data["lat"]);
          userLat.add(data["lat"]);
          userLong.add(data["long"]);

          getAddress(data["lat"], data["long"]);
          print("s" + userLong[i].toString());
          i++;
        }
      });
    } catch (e) {
      Get.snackbar("about User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Some error found, Please try again!",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    address.add("${placemarks[0].street!} ${placemarks[0].country!}");

    for (int i = 0; i < placemarks.length; i++) {
      print("User $i ${placemarks[i]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Center(
              child: Container(
            height: h,
            width: w,
            child: Center(
              child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(23.2247272, 77.4036721),
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/adityakulshrestha/cldyx7irq001p01texxcz52rh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRpdHlha3Vsc2hyZXN0aGEiLCJhIjoiY2xkeXZ5amcwMGgzcTN1bndjb3M2YTRvNSJ9.6HXyPMZHSuYMuscm9TczHw",
                        additionalOptions: {
                          'accessToken':
                              'pk.eyJ1IjoiYWRpdHlha3Vsc2hyZXN0aGEiLCJhIjoiY2xkeXZ5amcwMGgzcTN1bndjb3M2YTRvNSJ9.6HXyPMZHSuYMuscm9TczHw',
                          'id': 'mapbox.mapbox-streets-v8  '
                        }),
                    MarkerLayerOptions(markers:
                        // markers.cast<Marker>()
                        [
                      Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(23.2247272, 77.4036721),
                          builder: (ctx) => Container(
                                child:
                                    const Icon(Icons.account_circle, size: 40),
                              )),
                    ]),
                  ]),
            ),
          )),
          // Text('PickUp Locations:'),
          Positioned(
              bottom: 170,
              left: 148,
              child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      print("shivam");
                      userlocfun();
                      print(userLong.length);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 148, 133)),
                  child: const Text('Track Pick-Ups',
                      style: TextStyle(color: Colors.white)))),
          (address.length > 0)
              ? Positioned(
                  top: 30,
                  left: 3,
                  child: Stack(children: [
                    Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.2),
                        border: const Border(
                          left: BorderSide(
                            color: Colors.green,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 80,
                          width: 400,
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Column(children: [
                                  for (var item in address)
                                    Center(
                                      child: Container(
                                          width: 200,
                                          height: 20,
                                          child: Text("Address:$item",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15))),
                                    )
                                ]),
                              ],
                            ),
                          )),
                    ),
                  ]),
                )
              : Container(),
        ]),
      ),
    );
  }
}
