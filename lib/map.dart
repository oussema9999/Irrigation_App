import 'dart:async';
import 'client.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

const String google_api_key = "AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08";
const Color primaryColor = Color(0xFF7B61FF);
const double defaultPadding = 16.0;


class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(36.8869376,10.2170624);
  static const LatLng destination = LatLng(36.8869376, 10.2170624);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Irregation Map",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
        ),

        body:
        FutureBuilder(
            future: clientlocaion(),
            builder: (context, snapshot ){
              if (snapshot.hasData) {
               return GoogleMap(initialCameraPosition: CameraPosition(
                    target:  LatLng(double.parse(snapshot.data[0]),double.parse(snapshot.data[1])), zoom: 14.5),
               markers: {
                 Marker (
                   markerId: MarkerId("vane1"),
                   position: LatLng(double.parse(snapshot.data[0]),double.parse(snapshot.data[1])),
                 ),
               },
               );
              }
    return CircularProgressIndicator();
            }),
    );
  }
}




