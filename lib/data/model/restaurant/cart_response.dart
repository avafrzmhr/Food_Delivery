// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:food_delivery/data/model/restaurant/menu_response.dart';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  int id;
  RestaurantCart restaurantCart;
  Menu food;
  int quantity;

  Cart({
    required this.id,
    required this.restaurantCart,
    required this.food,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        restaurantCart: RestaurantCart.fromJson(json["restaurant_cart"]),
        food: Menu.fromJson(json["food"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_cart": restaurantCart.toJson(),
        "food": food.toJson(),
        "quantity": quantity,
      };
}

class RestaurantCart {
  int id;
  Restaurant restaurant;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> detail;
  bool isCompelete;

  RestaurantCart({
    required this.id,
    required this.restaurant,
    required this.createdAt,
    required this.updatedAt,
    required this.detail,
    required this.isCompelete,
  });

  factory RestaurantCart.fromJson(Map<String, dynamic> json) => RestaurantCart(
        id: json["id"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        detail: List<String>.from(json["detail"].map((x) => x)),
        isCompelete: json["is_compelete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant": restaurant.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "detail": List<dynamic>.from(detail.map((x) => x)),
        "is_compelete": isCompelete,
      };
}

class Restaurant {
  int id;
  String name;
  String image;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
