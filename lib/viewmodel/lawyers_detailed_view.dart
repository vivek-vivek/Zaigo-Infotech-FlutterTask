// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/res/constants.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

import '../utils/custom_colors.dart';
import '../widgets/back_button.dart';
import '../widgets/user_avatar.dart';

class LawyersDetailedView extends StatelessWidget {
  LawyersDetailedView({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: kBlack,
      body: ListView(
        padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
        children: [
          const CustomBackButton(),
          UserAvatar(home: home, index: index),
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mr. ${home.lawyers[index].name} ", style: kHeading1),
              Text("⭐${home.lawyers[index].ranking} ", style: kHeading2)
            ],
          ),
          Text(
            home.lawyers[index].address,
            style: kHeading2,
          ),
          kHeight5,
          Text(
            "Field of expertise  :  ${home.lawyers[index].fieldOfExpertise}",
            style: kHeading2,
          ),
          kHeight5,
          Text("UUID : ${home.lawyers[index].uuid}", style: kHeading2),
          const Divider(color: kGrey),
          kHeight5,
          Text(home.lawyers[index].bio, style: kHeading2),
          kHeight10,
          Text("Level : ${home.lawyers[index].level}", style: kHeading2),
          Text("Rating : ${home.lawyers[index].rating}", style: kHeading2),
          kHeight5,
          const Divider(color: kGrey),
          kHeight10,
          Text(
            "Phone Number : ${home.lawyers[index].phoneNo}",
            style: kHeading2,
          ),
          kHeight5,
          Text("Email : ${home.lawyers[index].email}", style: kHeading2),
          kHeight5,
        ],
      ),
    );
  }
}
