import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/adress_provider.dart';

// A method that uses the geocoding package to get the address from the latitude and longitude
Future<void> getAddress(context) async {
  final location = Provider.of<LocationProvider>(context, listen: false);
  try {
    // Get the list of placemarks from the geocoding package
    log("1");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    log("2");
    for (var element in placemarks) {
      log(element.name.toString());
    }
    // Get the first placemark from the list
    Placemark placemark = placemarks.first;
    // Get the formatted address from the placemark
    String formattedAddress =
        '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
    // Set the address value and update the state
    location.changeAdress(formattedAddress);
  } catch (e) {
    // Handle any errors
    print(e);
  }
}

///===========================================================================================================

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled
    return Future.error('Location services are not enabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Location permissions are denied
      return Future.error('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Location permissions are permanently denied, we cannot request permissions.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // Get the current position
  return await Geolocator.getCurrentPosition();
}
