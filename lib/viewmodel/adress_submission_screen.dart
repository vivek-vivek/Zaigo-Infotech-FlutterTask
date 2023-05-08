import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/adress_provider.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';

import '../utils/find_location.dart';

// A stateful widget that combines the input and address screens
class AdressSubMissionScreen extends StatelessWidget {
  AdressSubMissionScreen({Key? key}) : super(key: key);

  // The form key for validating the input
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationProvider>(context);
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Combined Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // A text form field for the latitude
              ColoredBox(
                color: Colors.white60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Latitude',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                  // Validate the input and set the latitude value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a latitude';
                    }
                    try {
                      Provider.of<LocationProvider>(context, listen: false)
                          .pharseLatitute(value);
                      return null;
                    } catch (e) {
                      return 'Please enter a valid number';
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              // A text form field for the longitude
              ColoredBox(
                color: Colors.white60,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Longitude',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.number,
                  // Validate the input and set the longitude value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a longitude';
                    }
                    try {
                      Provider.of<LocationProvider>(context, listen: false)
                          .pharseLongitude(value);
                      return null;
                    } catch (e) {
                      return 'Please enter a valid number';
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              // A button to get the address from the input values
              ElevatedButton(
                onPressed: () async {
                  // Validate the form and call the method to get the address
                  if (formKey.currentState!.validate()) {
                    await getAddress(context);
                  }
                },
                child: const Text('Get Address'),
              ),
              const SizedBox(height: 16),
              // Display the latitude and longitude
              Text(
                'Latitude: ${location.latitude}',
                style: const TextStyle(fontSize: 20, color: kWhite),
              ),
              Text(
                'Longitude: ${location.longitude}',
                style: const TextStyle(fontSize: 20, color: kWhite),
              ),
              const SizedBox(height: 20),
              // Display the address or a loading indicator
              location.address == null
                  ? const CircularProgressIndicator()
                  : Text(
                      'Address: ${location.address}',
                      style: const TextStyle(fontSize: 20, color: kWhite),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
