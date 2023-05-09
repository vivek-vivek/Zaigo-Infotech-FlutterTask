// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zaigo_infotech_flutter_task/res/constants.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';
import 'package:zaigo_infotech_flutter_task/viewmodel/lawyers_detailed_view.dart';

import '../res/provider/home_provider.dart';

class LawyersCard extends StatelessWidget {
  LawyersCard({super.key, required this.home, required this.index});

  final HomeProvider home;
  int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LawyersDetailedView(index: index),
          ),
        );
      },
      leading: home.isConected
          ? CircleAvatar(
              backgroundImage: NetworkImage(home.lawyers[index].profilePicture),
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child:
                  Text(home.lawyers[index].name.substring(0, 1).toUpperCase()),
            )
          : CircleAvatar(
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child:
                  Text(home.lawyers[index].name.substring(0, 1).toUpperCase()),
            ),
      title: Text(
        home.lawyers[index].name,
        style: const TextStyle(
          color: kWhite,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        home.lawyers[index].fieldOfExpertise,
        style: const TextStyle(color: kWhite),
      ),
      trailing: Column(
        children: [
          const Text(
            "Rating",
            style: kHeading2,
          ),
          Text(
            home.lawyers[index].rating,
            style: kHeading2,
          ),
        ],
      ),
    );
  }
}
