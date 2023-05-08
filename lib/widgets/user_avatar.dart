import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.home,
    required this.index,
  });

  final HomeProvider home;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(home.lawyers[index].profilePicture),
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Text(
        home.lawyers[index].name.substring(0, 1).toUpperCase(),
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
