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

        for (int i = 0; i < lawyerModel.data.length - 1; i++) {
          home.addLawyerRespone(lawyerModel.data[i]);

          log(lawyerModel.data[i].id.toString());

          try {
            final Lawyer offlineLawyerModel = Lawyer(
              lawyerModel.data[i].id,
              lawyerModel.data[i].uuid,
              lawyerModel.data[i].name,
              lawyerModel.data[i].address,
              lawyerModel.data[i].state,
              lawyerModel.data[i].fieldOfExpertise,
              lawyerModel.data[i].bio,
              lawyerModel.data[i].level,
              lawyerModel.data[i].hoursLogged,
              lawyerModel.data[i].phoneNo,
              lawyerModel.data[i].email,
              lawyerModel.data[i].areasOfPractise,
              lawyerModel.data[i].serviceOffered,
              lawyerModel.data[i].profilePicture,
              lawyerModel.data[i].rating,
              lawyerModel.data[i].ranking,
            );
            var lawyerBox = Hive.box<Lawyer>('lawyerBox');

            await lawyerBox.put(lawyerModel.data[i].id, offlineLawyerModel);
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
