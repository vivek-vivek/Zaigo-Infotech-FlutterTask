import 'package:hive/hive.dart';
import 'package:zaigo_infotech_flutter_task/model/lawyers_model.dart';

part 'offline_data_model.g.dart';

// Define your data model class and annotate it with @HiveType
@HiveType(typeId: 0)
class Lawyer {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String uuid;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final String state;

  @HiveField(5)
  final String fieldOfExpertise;

  @HiveField(6)
  final String bio;

  @HiveField(7)
  final String level;

  @HiveField(8)
  final String hoursLogged;

  @HiveField(9)
  final String phoneNo;

  @HiveField(10)
  final String email;

  @HiveField(11)
  final List<dynamic> areasOfPractise;

  @HiveField(12)
  final List<dynamic> serviceOffered;

  @HiveField(13)
  final String profilePicture;

  @HiveField(14)
  final String rating;

  @HiveField(15)
  final String ranking;



  Lawyer(
      this.id,
      this.uuid,
      this.name,
      this.address,
      this.state,
      this.fieldOfExpertise,
      this.bio,
      this.level,
      this.hoursLogged,
      this.phoneNo,
      this.email,
      this.areasOfPractise,
      this.serviceOffered,
      this.profilePicture,
      this.rating,
      this.ranking,);
}
