// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:zaigo_infotech_flutter_task/model/offline_data_model.dart';

// class OfflineDataProvider with ChangeNotifier {
//   // Define the name of the Hive box
//   static const HiveBoxName = "OfflineData";
//   // Declare a box variable to store and retrieve tasks
//   late Box<OfflineDataModel> _box;

//   // Constructor to initialize the Hive box
//   OfflineDataProvider() {
//     _initBox();
//   }

//   // Initialize the Hive box with the name 'OfflineData'
//   _initBox() async {
//     _box = await Hive.openBox<OfflineDataModel>(HiveBoxName);
//     notifyListeners();
//   }

//   // Get all the offline data from the box as a list
//   List<OfflineDataModel> get offlineData => _box.values.toList();

//   // Add new offline data to the box and notify listeners
//   addOfflineData(OfflineDataModel offlineData) {
//     _box.add(offlineData);
//     notifyListeners();
//   }

//   // Update offline data in the box and notify listeners
//   updateOfflineData(int index, OfflineDataModel offlineData) {
//     _box.putAt(index, offlineData);
//     notifyListeners();
//   }

//   // Delete offline data from the box at a given index and notify listeners
//   deleteOfflineData(int index) {
//     _box.deleteAt(index);
//     notifyListeners();
//   }

//   // Get offline data from the box with a given key
//   OfflineDataModel? getOfflineDataKey(String key) {
//     final offlineData = _box.get(key);
//     if (offlineData != null) {
//       return offlineData;
//     }
//     return null;
//   }

  
// }
