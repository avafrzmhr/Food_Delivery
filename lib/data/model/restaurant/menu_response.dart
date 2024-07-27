// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

List<Menu> menuFromJson(String str) =>
    List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  int id;
  String image;
  String categoryName;
  String name;
  String desc;
  double price;
  int averageRating;

  Menu({
    required this.id,
    required this.image,
    required this.categoryName,
    required this.name,
    required this.desc,
    required this.price,
    required this.averageRating,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        image: json["image"],
        categoryName: json["category_name"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"]?.toDouble(),
        averageRating: json["average_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category_name": categoryName,
        "name": name,
        "desc": desc,
        "price": price,
        "average_rating": averageRating,
      };
}
