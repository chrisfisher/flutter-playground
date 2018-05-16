import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'dart:async';

class LocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get current location")),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Get location"),
            onPressed: () {
              _getLocation();
            },
          ),
          Text("Unknown"),
        ],
      ),
    );
  }

  Future<void> _getLocation() async {
    final hasPermission = await _hasPermission();
    if (!hasPermission) return;

    final subscription = Geolocation
        .currentLocation(accuracy: LocationAccuracy.best)
        .listen((result) {
      if (result.isSuccessful) {
        final latitude = result.location.latitude;
        final longitude = result.location.longitude;
        //
      }
    });
  }

  Future<bool> _hasPermission() async {
    final permission = const LocationPermission(
      android: LocationPermissionAndroid.fine,
      ios: LocationPermissionIOS.always,
    );
    final result = await Geolocation.requestLocationPermission(permission);
    return result.isSuccessful;
  }
}
