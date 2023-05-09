// Define an enum to represent the current state of the data
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../model/lawyers_model.dart';
import '../../model/offline_data_model.dart';
import '../provider/home_provider.dart';

enum DataStatus { loading, success, error }

// Define a function that returns the data from the Hive box as a list
Future getLawyers(context) async {
  final home = Provider.of<HomeProvider>(context, listen: false);
  // Get the Hive box instance
  var lawyerBox = Hive.box<Lawyer>('lawyerBox');
  // Get all the lawyers as an iterable
  var lawyers = lawyerBox.values.toList();
  // Convert the iterable to a list and return it

// Convert the List<Lawyer> to List<Datum>
  List<Datum> datumList = lawyers
      .map((lawyer) => Datum(
          id: lawyer.id,
          uuid: lawyer.uuid,
          name: lawyer.name,
          address: lawyer.address,
          state: lawyer.state,
          fieldOfExpertise: lawyer.fieldOfExpertise,
          bio: lawyer.bio,
          level: lawyer.level,
          hoursLogged: lawyer.hoursLogged,
          phoneNo: lawyer.phoneNo,
          email: lawyer.email,
          areasOfPractise: lawyer.areasOfPractise,
          serviceOffered: lawyer.serviceOffered,
          profilePicture: lawyer.profilePicture,
          rating: lawyer.rating,
          ranking: lawyer.ranking))
      .toList();
  // Passing the List<Datum> to the method
  for (var element in datumList) {
    home.addLawyerRespone(element);
  }
}
