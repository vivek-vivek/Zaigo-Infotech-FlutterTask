
import 'dart:convert';

class LawyerModel {
    final String message;
    final int code;
    final List<Datum> data;
    final int pages;
    final List<State> states;

    LawyerModel({
        required this.message,
        required this.code,
        required this.data,
        required this.pages,
        required this.states,
    });

    factory LawyerModel.fromRawJson(String str) => LawyerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LawyerModel.fromJson(Map<String, dynamic> json) => LawyerModel(
        message: json["message"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pages: json["pages"],
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pages": pages,
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String uuid;
    final String name;
    final String address;
    final String state;
    final String fieldOfExpertise;
    final String bio;
    final String level;
    final String hoursLogged;
    final String phoneNo;
    final String email;
    final List<dynamic> areasOfPractise;
    final List<dynamic> serviceOffered;
    final String profilePicture;
    final String rating;
    final String ranking;

    Datum({
        required this.id,
        required this.uuid,
        required this.name,
        required this.address,
        required this.state,
        required this.fieldOfExpertise,
        required this.bio,
        required this.level,
        required this.hoursLogged,
        required this.phoneNo,
        required this.email,
        required this.areasOfPractise,
        required this.serviceOffered,
        required this.profilePicture,
        required this.rating,
        required this.ranking,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        address: json["address"],
        state: json["state"],
        fieldOfExpertise: json["field_of_expertise"],
        bio: json["bio"],
        level: json["level"],
        hoursLogged: json["hours_logged"],
        phoneNo: json["phone_no"],
        email: json["email"],
        areasOfPractise: List<dynamic>.from(json["areas_of_practise"].map((x) => x)),
        serviceOffered: List<dynamic>.from(json["service_offered"].map((x) => x)),
        profilePicture: json["profile_picture"],
        rating: json["rating"],
        ranking: json["ranking"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "address": address,
        "state": state,
        "field_of_expertise": fieldOfExpertise,
        "bio": bio,
        "level": level,
        "hours_logged": hoursLogged,
        "phone_no": phoneNo,
        "email": email,
        "areas_of_practise": List<dynamic>.from(areasOfPractise.map((x) => x)),
        "service_offered": List<dynamic>.from(serviceOffered.map((x) => x)),
        "profile_picture": profilePicture,
        "rating": rating,
        "ranking": ranking,
    };
}

class State {
    final String stateName;
    final int id;

    State({
        required this.stateName,
        required this.id,
    });

    factory State.fromRawJson(String str) => State.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory State.fromJson(Map<String, dynamic> json) => State(
        stateName: json["state_name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "state_name": stateName,
        "id": id,
    };
}
