// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/adress_provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/login_provider.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/home_screen.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/lawyers_detailed_view.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/login_screen.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final isLoggedIn = sharedPreferences.getBool('islogined') ?? false;

  runApp(MyApp(isLogined: isLoggedIn));
}

class MyApp extends StatelessWidget {
  bool isLogined;
  MyApp({required this.isLogined, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          '/splash': (context) => SplashScreen(isLogin: isLogined),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/lawyersDetailedView': (context) => LawyersDetailedView(index: 0),
        },
        home: SplashScreen(isLogin: isLogined),
      ),
    );
  }
}
