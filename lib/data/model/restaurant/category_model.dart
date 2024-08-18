import 'dart:convert';

import 'dart:convert';

List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(
    json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  final int id;
  final String categoryName;

  CategoryModel({
    required this.id,
    required this.categoryName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode;
}
