import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zaigo_infotech_flutter_task/res/constants.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log("App louned");

    Timer(
      const Duration(seconds: 5),
      () => widget.isLogin
          ? Navigator.pushReplacementNamed(context, '/home')
          : Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: Image.asset(AssetNames.spalshGif),
      ),
    );
  }
}
