import 'package:food_delivery/data/model/neshan/neshan_search_response/item.dart';

class NeshanSearchResponse {
  int? count;
  List<Item>? items;

  NeshanSearchResponse({this.count, this.items});

  factory NeshanSearchResponse.fromJson(Map<String, dynamic> json) {
    return NeshanSearchResponse(
      count: json['count'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
