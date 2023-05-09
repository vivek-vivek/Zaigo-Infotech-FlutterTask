import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/utils/authentication.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

import 'package:zaigo_infotech_flutter_task/res/services/lawyers_services.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/adress_submission_screen.dart';
import 'package:zaigo_infotech_flutter_task/widgets/exit_dialoge_box.dart';

import '../widgets/laawyers_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([LawyersServices().connectionTask(context)]);
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AdressSubMissionScreen(),
              ),
            );
          },
          icon: const Icon(Icons.location_on_outlined, color: kWhite),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Show the dialog when the button is pressed
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ExitPopUpDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                color: kWhite,
              ))
        ],
        elevation: 0,
      ),
      body: home.loadingState || home.lawyers.isEmpty
          ? const Center(
              child: SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(color: kWhite),
              ),
            )
          : ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) =>
                  LawyersCard(home: home, index: index),
              separatorBuilder: (context, index) => const Divider(color: kGrey),
            ),
    );
  }
}
