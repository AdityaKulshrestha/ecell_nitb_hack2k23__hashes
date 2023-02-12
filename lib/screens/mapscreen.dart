import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong/latlong.dart';

import 'camera.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String name = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        name = ds.data()!['name'];
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  double? lat;
  double? long;
  String address = "";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then(((value) {
      print("Vlaue $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      getAddress(value.latitude, value.longitude);
    })).catchError((error) {
      print("Error $error");
    });
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      address = "${placemarks[0].street!} ${placemarks[0].country!}";
    });
    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }

  var weightcontroller = TextEditingController();
  var wardcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: FutureBuilder(
              future: _fetch(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Text('Loading data...Please Wait');
                } else {
                  return Text(
                    'Hello..$name',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  );
                }
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: getLatLong,
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 148, 133)),
              child: const Text('Get your current location',
                  style: TextStyle(color: Colors.white))),
          const SizedBox(
            height: 20,
          ),
          (lat != null)
              ? const Text(
                  "Your current location is:",
                  style: TextStyle(fontSize: 20),
                )
              : Container(),
          (lat != null)
              ? const SizedBox(
                  height: 10,
                )
              : Container(),
          (lat != null) ? Text("Lat: $lat") : Container(),
          (lat != null) ? Text("Long $long") : Container(),
          (lat != null) ? Text("Address: $address ") : Container(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 350,
              width: 350,
              child: Center(
                child: (lat != null)
                    ? FlutterMap(
                        options: MapOptions(
                          center: LatLng(lat, long),
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
                            MarkerLayerOptions(markers: [
                              Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: (lat == null)
                                      ? LatLng(26.9079247, 80.9471215)
                                      : LatLng(lat, long),
                                  builder: (ctx) => Container(
                                        child: const Icon(Icons.location_on,
                                            size: 40),
                                      ))
                            ])
                          ])
                    : Container(
                        height: 350,
                        width: 350,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image:
                              AssetImage("img/images/tb-removebg-preview.png"),
                          fit: BoxFit.fill,
                        )),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CameraPage()));
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 148, 133)),
              child: const Text('Seggregate your waste',
                  style: TextStyle(color: Colors.white))),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          // overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      controller: weightcontroller,
                                      decoration: const InputDecoration(
                                        hintText: "Estimated weight (kg)",
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      controller: wardcontroller,
                                      decoration: const InputDecoration(
                                        hintText: "Ward Number",
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 148, 133),
                                    ),
                                    child: Text("Submit"),
                                    onPressed: () {
                                      (lat != null)
                                          ? FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(auth.currentUser?.uid)
                                              .set({
                                              "long": long,
                                              "lat": lat,
                                              "ward": wardcontroller.text,
                                              "weight": weightcontroller.text,
                                            }).then(
                                              (value) => Get.snackbar(
                                                  "about User", "user message",
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  titleText: const Text(
                                                    "Adding PickUp Location Done",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  messageText: const Text(
                                                      'We will notify you when collector is nearby you!',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                            )
                                          : Get.snackbar(
                                              "about User", "user message",
                                              backgroundColor: Colors.redAccent,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              titleText: const Text(
                                                "Adding PickUp Location Failed",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              messageText: const Text(
                                                  'Please first press Get you current location button',
                                                  style: TextStyle(
                                                      color: Colors.white)));
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
                // (lat != null)
                //     ? FirebaseFirestore.instance
                //         .collection('Users')
                //         .doc(auth.currentUser?.uid)
                //         .set({"long": long, "lat": lat}).then(
                //         (value) => Get.snackbar("about User", "user message",
                //             backgroundColor: Colors.redAccent,
                //             snackPosition: SnackPosition.BOTTOM,
                //             titleText: const Text(
                //               "Adding PickUp Location Done",
                //               style: TextStyle(color: Colors.white),
                //             ),
                //             messageText: const Text(
                //                 'We will notify you when collector is nearby you!',
                //                 style: TextStyle(color: Colors.white))),
                //       )
                //     : Get.snackbar("about User", "user message",
                //         backgroundColor: Colors.redAccent,
                //         snackPosition: SnackPosition.BOTTOM,
                //         titleText: const Text(
                //           "Adding PickUp Location Failed",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //         messageText: const Text(
                //             'Please first press Get you current location button',
                //             style: TextStyle(color: Colors.white)));
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 148, 133)),
              child: const Text('Confirm waste pickup location',
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    ));
  }
}
