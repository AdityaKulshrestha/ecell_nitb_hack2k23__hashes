import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String name = "";
  var long;
  var lat;
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
  // currentLoc(){  if ("geolocation" in navigator) {
  // navigator.geolocation.getCurrentPosition(position => {
  //   long=position.coords.longitude;
  //   lat=position.coords.latitude;}}
  //   else{
  //     long=80.9471215;
  //     lat=26.9079247;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 350,
              width: 350,
              child: Center(
                child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(26.9079247, 80.9471215),
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
                            point: LatLng(26.9079247, 80.9471215),
                            builder: (ctx) => Container(
                                  child:
                                      const Icon(Icons.location_on, size: 40),
                                ))
                      ])
                    ]),
              ),
            ),
          )
        ],
      ),
    ));
  }
}