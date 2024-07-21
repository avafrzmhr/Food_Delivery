import 'package:food_delivery/data/model/neshan/neshan_search_response/location.dart';

class Item {
  String? title;
  String? address;
  String? neighbourhood;
  String? region;
  String? type;
  String? category;
  Location? location;

  Item({
    this.title,
    this.address,
    this.neighbourhood,
    this.region,
    this.type,
    this.category,
    this.location,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json['title'] as String?,
        address: json['address'] as String?,
        neighbourhood: json['neighbourhood'] as String?,
        region: json['region'] as String?,
        type: json['type'] as String?,
        category: json['category'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'address': address,
        'neighbourhood': neighbourhood,
        'region': region,
        'type': type,
        'category': category,
        'location': location?.toJson(),
      };
}
