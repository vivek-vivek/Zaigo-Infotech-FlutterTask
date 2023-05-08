// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_infotech_flutter_task/res/api_end_points.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

import '../../model/lawyers_model.dart';

class LawyersServices {
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
        }
      } else {
        // Handle the error
        log('Request failed with status code: ${response.statusCode}');
      }
      home.changeloadingState(false);
    } catch (error) {
      // Handle the exception
      log('Request failed with error: $error');
    }
  }
}



// void main() async {
//   final url = 'https://example.com/lawyers';
//   final response = await Dio().get(url);
//   final responseData = json.decode(response.toString());
//   final lawyers = LawyerListResponse.fromJson(responseData).data;
//   for (var lawyer in lawyers) {
//     print(lawyer.name);
//   }
// }

