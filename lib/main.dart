// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_infotech_flutter_task/model/offline_data_model.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/adress_provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/login_provider.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/home_screen.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/lawyers_detailed_view.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/login_screen.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get  login sate from sharedpreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  final isLoggedIn = sharedPreferences.getBool('islogined') ?? false;

  await Hive.initFlutter();
  // Register our TypeAdapter
  Hive.registerAdapter(LawyerAdapter());
  // Open a box
  await Hive.openBox<Lawyer>('lawyerBox');

  runApp(MyApp(isLogined: isLoggedIn));
}

class MyApp extends StatelessWidget {
  bool isLogined;
  MyApp({required this.isLogined, super.key});

  @override
  Widget build(BuildContext context) {
    // Use the MultiProvider widget to provide multiple providers to the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider()),
        // ChangeNotifierProvider<OfflineDataProvider>(
        //     create: (_) => OfflineDataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        // Define the app's navigation routes
        routes: {
          '/splash': (context) => SplashScreen(isLogin: isLogined),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/lawyersDetailedView': (context) => LawyersDetailedView(index: 0),
        },
        // Set the app's initial route to the SplashScreen
        home: SplashScreen(isLogin: isLogined),
      ),
    );
  }
}
