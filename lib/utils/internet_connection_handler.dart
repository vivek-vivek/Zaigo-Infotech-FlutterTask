import 'dart:io';

import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/res/services/lawyers_services.dart';

import '../res/hive/offline_data_box.dart';
import '../res/provider/home_provider.dart';

// check interncet Conection and perform offline and online data services
Future connectionTask(context) async {
  final home = Provider.of<HomeProvider>(context, listen: false);
  // Perform an address lookup
  try {
    // Device has internet access
    final result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await LawyersServices().callLawyerApi(context);
    }
  }
  // Device has no internet access
  on SocketException catch (_) {
    home.changeConecetionSate(false);
    getLawyers(context);
  }
}
