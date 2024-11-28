// To parse this JSON data, do
//
//     final Profile = ProfileFromJson(jsonString);

import 'dart:convert';

List<Profile> profileFromJson(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  final int id;
  final User user;
  final String addressName;
  final double latitude;
  final double longitude;
  final int score;

  Profile({
    required this.id,
    required this.user,
    required this.addressName,
    required this.latitude,
    required this.longitude,
    required this.score,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        user: User.fromJson(json["user"]),
        addressName: json["address_name"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "address_name": addressName,
        "latitude": latitude,
        "longitude": longitude,
        "score": score,
      };
}

class User {
  final int id;
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
      };
}
