import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_infotech_flutter_task/res/api_end_points.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/login_provider.dart';
import 'package:zaigo_infotech_flutter_task/widgets/snack_bars.dart';

import '../viewmodel/splash_screen.dart';

class Authentication {
  ///----------------------------------[User ligin]------------------------------------
  Future loginUser(context) async {
    final userLogin = Provider.of<LoginProvider>(context, listen: false);
    // change to loading state
    userLogin.showLoadingState(true);
    Dio dio = Dio();

    // initialize dio interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('Request: ${options.method} ${options.uri}');
          log('Headers: ${options.headers}');
          log('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          log('Response: ${response.statusCode} ${response.requestOptions.uri}');
          log('Headers: ${response.headers}');
          // log('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          log('Error: ${error.message}');
          log('Stack trace: ${error.stackTrace}');
          return handler.next(error);
        },
      ),
    );
    try {
      Response response = await dio.post(
        ApiEndPoints.userLogin,
        data: {
          "phone_no": userLogin.phone.text,
          "password": userLogin.password.text
        },
      );

      if (response.statusCode == 200) {
        // creating a shared prefernce instance
        final sharedPreferences = await SharedPreferences.getInstance();

        // store login state in the shared preferences
        sharedPreferences.setBool('islogined', true);

        // store ACCESS_TOKEN in the sharedpreferences
        sharedPreferences.setString(
          "ACCESS_TOKEN",
          response.data["access_token"],
        );
        userLogin.disposesControllers();
        CustomSnackBars.signup(
          content: 'Logined successfully !',
          bgColor: const Color.fromARGB(255, 44, 133, 112),
          textColor: Colors.black,
        );
        // Home page
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on DioError catch (e, s) {
      log('Its dio erorr\n', error: e, stackTrace: s);
      throw ' watch out !';
    }

    userLogin.showLoadingState(true);
  }

  //
  ///----------------------------------[User Logout]------------------------------------

  Future<void> userLogout(context) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // remove login state from shared preferences
    sharedPreferences.remove('islogined');

    // navigate to the login pafe
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SplashScreen(
          isLogin: false,
        ),
      ),
    );
  }
  //---------------------------------------------------------------------------------------
}












/*

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('Request: ${options.method} ${options.uri}');
          log('Headers: ${options.headers}');
          log('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          log('Response: ${response.statusCode} ${response.requestOptions.uri}');
          log('Headers: ${response.headers}');
          // log('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          log('Error: ${error.message}');
          log('Stack trace: ${error.stackTrace}');
          return handler.next(error);
        },
      ),
    );

*/
