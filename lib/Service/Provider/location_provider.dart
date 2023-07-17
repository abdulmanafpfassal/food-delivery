import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddelivery/Service/Repo/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  LocationRepo _locationRepo = LocationRepo();
  Position? locationData;
  String latitude = "";
  String longitude = "";
  List<Placemark> placeMarks = [];
  String selectedLocation = "Search Location";

  setLocationData() async {
    locationData = await _locationRepo.determinePosition();
    latitude = locationData!.latitude.toString();
    longitude = locationData!.longitude.toString();

    placeMarks = await placemarkFromCoordinates(double.parse(latitude), double.parse(longitude));
    selectedLocation = placeMarks[0].street.toString() + " " + placeMarks[0].locality.toString();
    notifyListeners();
  }



}