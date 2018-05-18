import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart'
    show
        Geolocation,
        LocationAccuracy,
        LocationPermission,
        LocationPermissionAndroid,
        LocationPermissionIOS;
import "package:google_maps_webservice/places.dart";
import 'dart:async';

class LocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  final places = new GoogleMapsPlaces("API_KEY");

  double latitude;
  double longitude;
  String place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get current location")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: Text("Get location"),
              onPressed: () {
                _getLocation();
              },
            ),
            Text("Latitude: $latitude"),
            Text("Longitude: $longitude"),
            Text("Place: $place"),
          ],
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    final hasPermission = await _hasPermission();
    if (!hasPermission) return;

    Geolocation
        .currentLocation(accuracy: LocationAccuracy.best)
        .listen((result) async {
      if (!result.isSuccessful) return;

      setState(() {
        latitude = result.location.latitude;
        longitude = result.location.longitude;
      });

      PlacesSearchResponse searchResponse = await places.searchNearbyWithRadius(
          Location(
            result.location.latitude,
            result.location.longitude,
          ),
          500);

      if (searchResponse == null || searchResponse.results.length == 0) return;
      final firstResult = searchResponse.results[0];

      setState(() {
        place = firstResult.name;
      });
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
