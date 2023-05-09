// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_infotech_flutter_task/model/offline_data_model.dart';
import 'package:zaigo_infotech_flutter_task/res/api_end_points.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

import 'dart:io';
import '../../model/lawyers_model.dart';

class LawyersServices {
  // Get a reference to the box

  Future connectionTask(context) async {
    final home = Provider.of<HomeProvider>(context, listen: false);
    // Perform an address lookup
    try {
      // Device has internet access
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await callLawyerApi(context);
      }
    }
    // Device has no internet access
    on SocketException catch (_) {
      home.changeConecetionSate(false);
      getLawyers(context);
    }
  }

  // Define a function that returns the data from the Hive box as a list
  Future getLawyers(context) async {
    final home = Provider.of<HomeProvider>(context, listen: false);
    // Get the Hive box instance
    var lawyerBox = Hive.box<Lawyer>('lawyerBox');
    // Get all the lawyers as an iterable
    var lawyers = lawyerBox.values.toList();
    // Convert the iterable to a list and return it

// Convert the List<Lawyer> to List<Datum>
    List<Datum> datumList = lawyers
        .map((lawyer) => Datum(
            id: lawyer.id,
            uuid: lawyer.uuid,
            name: lawyer.name,
            address: lawyer.address,
            state: lawyer.state,
            fieldOfExpertise: lawyer.fieldOfExpertise,
            bio: lawyer.bio,
            level: lawyer.level,
            hoursLogged: lawyer.hoursLogged,
            phoneNo: lawyer.phoneNo,
            email: lawyer.email,
            areasOfPractise: lawyer.areasOfPractise,
            serviceOffered: lawyer.serviceOffered,
            profilePicture: lawyer.profilePicture,
            rating: lawyer.rating,
            ranking: lawyer.ranking))
        .toList();
    // Pass the List<Datum> to the method
    for (var element in datumList) {
      home.addLawyerRespone(element);
    }
  }

  // Call the API service and store the response in the box
  Future callLawyerApi(context) async {
    final home = Provider.of<HomeProvider>(context, listen: false);

    home.changeloadingState(true);
    Dio dio = Dio();
    // creating a shared prefernce instance
    final sharedPreferences = await SharedPreferences.getInstance();

    /// retriving [ACCESS_TOKEN] state from shared preferences
    final ACCESS_TOKEN = sharedPreferences.getString('ACCESS_TOKEN');
    log(ACCESS_TOKEN.toString());
    // verification with ACCESS_TOKEN
    dio.options.headers = {'Authorization': 'Bearer $ACCESS_TOKEN'};

    try {
      Response response = await dio.get(ApiEndPoints.lawyers);

      if (response.statusCode == 200) {
        final lawyerModel = LawyerModel.fromJson(response.data);

        await home.clearLawyerList();

        for (final lawyer in lawyerModel.data) {
          home.addLawyerRespone(lawyer);

          try {
            final Lawyer lawyerModel = Lawyer(
              lawyer.id,
              lawyer.uuid,
              lawyer.name,
              lawyer.address,
              lawyer.state,
              lawyer.fieldOfExpertise,
              lawyer.bio,
              lawyer.level,
              lawyer.hoursLogged,
              lawyer.phoneNo,
              lawyer.email,
              lawyer.areasOfPractise,
              lawyer.serviceOffered,
              lawyer.profilePicture,
              lawyer.rating,
              lawyer.ranking,
            );
            var lawyerBox = Hive.box<Lawyer>('lawyerBox');
            await lawyerBox.put(lawyer.id, lawyerModel);
          } catch (e) {
            log(e.toString());
          }
        }
        home.changeloadingState(false);
      } else {
        // Handle the error
        log('Request failed with status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error fetching lawyers'),
        ));
        home.changeloadingState(false);
      }
      home.changeloadingState(false);
    } catch (error) {
      // Handle the exception
      log('Request failed with error: $error');
      home.changeloadingState(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $error")));
    }
  }
}
