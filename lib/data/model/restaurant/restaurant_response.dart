// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  List<RestaurantModel> data;

  Restaurant({
    required this.data,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        data: List<RestaurantModel>.from(
            json["data"].map((x) => RestaurantModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RestaurantModel {
  int id;
  String image;
  String category;
  String deliveryTime;
  double minCartPrice;
  double deliveryPrice;
  String name;
  String phoneNumber;
  String openTime;
  String closeTime;
  String addressName;
  double latitude;
  double longitude;
  dynamic distance;
  int? averageRating;

  RestaurantModel({
    required this.id,
    required this.image,
    required this.category,
    required this.deliveryTime,
    required this.minCartPrice,
    required this.deliveryPrice,
    required this.name,
    required this.phoneNumber,
    required this.openTime,
    required this.closeTime,
    required this.addressName,
    required this.latitude,
    required this.longitude,
    this.distance,
    this.averageRating,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        image: json["image"],
        category: json["category"],
        deliveryTime: json["delivery_time"],
        minCartPrice: json["min_cart_price"],
        deliveryPrice: json["delivery_price"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        addressName: json["address_name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        distance: json["distance"],
        averageRating: json["average_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category,
        "delivery_time": deliveryTime,
        "min_cart_price": minCartPrice,
        "delivery_price": deliveryPrice,
        "name": name,
        "phone_number": phoneNumber,
        "open_time": openTime,
        "close_time": closeTime,
        "address_name": addressName,
        "latitude": latitude,
        "longitude": longitude,
        "distance": distance,
        "average_rating": averageRating,
      };
}
