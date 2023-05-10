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

import '../../model/lawyers_model.dart';

class LawyersServices {
  // Get a reference to the box

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

      /// response success status => [200]
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
            await lawyerBox.clear();
            await lawyerBox.put(lawyer.id, lawyerModel);
          } catch (error) {
            log(error.toString());
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
