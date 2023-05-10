import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zaigo_infotech_flutter_task/model/lawyers_model.dart';

class HomeProvider with ChangeNotifier {
  List<Datum> lawyers = [];

  bool loadingState = false;
  bool isConected = true;

// set Internetconnection satate
  void changeConecetionSate(bool state) {
    isConected = state;
    notifyListeners();
  }

// remove duplications
  Future clearLawyerList() async {
    lawyers.clear();
    notifyListeners();
  }

// get datas drom api and update ui
  void addLawyerRespone(Datum lawyer) {
    lawyers.add(lawyer);
    log(lawyer.id.toString());
    notifyListeners();
  }

  void changeloadingState(bool newState) {
    loadingState = newState;
    notifyListeners();
  }

  logLawyersList() {
    for (var element in lawyers) {
      log("${element.id} ${element.name} ");
    }
  }
}
