import 'package:flutter/material.dart';

import '../../Helper/images.dart';

class RestaurantListProvider with ChangeNotifier {

  List restaurant = [];

  setRestaurantList() {
    restaurant = [
      {
        "image": Assets.ad1,
        "restaurant_name": "Delicious Bites",
        "delivery_time": "30 mins",
        "address": "123 Main Street, Cityville",
        "km_from_destination": 3.2
      },
      {
        "image": Assets.ad2,
        "restaurant_name": "Tasty Treats",
        "delivery_time": "25 mins",
        "address": "456 Elm Avenue, Townsville",
        "km_from_destination": 1.8
      },
      {
        "image": Assets.ad3,
        "restaurant_name": "Yummy Delights",
        "delivery_time": "40 mins",
        "address": "789 Oak Road, Villageville",
        "km_from_destination": 5.5
      },
      {
        "image": Assets.ad4,
        "restaurant_name": "Savory Eats",
        "delivery_time": "20 mins",
        "address": "101 Pine Lane, Suburbia",
        "km_from_destination": 2.7
      },
      {
        "image": Assets.ad5,
        "restaurant_name": "Cozy Café",
        "delivery_time": "15 mins",
        "address": "222 Willow Street, Riverside",
        "km_from_destination": 4.0
      }
    ];
    notifyListeners();
  }

}
