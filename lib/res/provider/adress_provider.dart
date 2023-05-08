import 'package:flutter/material.dart';


class LocationProvider extends ChangeNotifier {
  // The latitude and longitude values
  double latitude = 0.0;
  double longitude = 0.0;

  // The address value
  String? address;

  void pharseLatitute(value) {
    latitude = double.parse(value);
    notifyListeners();
  }

  void pharseLongitude(value) {
    longitude = double.parse(value);
    notifyListeners();
  }

  changeAdress(formattedAddress) {
    address = formattedAddress;
    notifyListeners();
  }
}
