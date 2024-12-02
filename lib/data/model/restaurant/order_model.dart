// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  final Data data;

  OrderModel({
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final int deliveryPrice;
  final int totalOrder;
  final int totalPrice;
  final dynamic totalPriceAfterDiscount;
  final String deliveryAddressName;
  final double latitude;
  final double longitude;
  final List<Detail> detail; // Updated to use a `Detail` class
  final bool paid;
  final String status;

  Data({
    required this.id,
    required this.deliveryPrice,
    required this.totalOrder,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
    required this.deliveryAddressName,
    required this.latitude,
    required this.longitude,
    required this.detail,
    required this.paid,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        deliveryPrice: json["delivery_price"],
        totalOrder: json["total_order"],
        totalPrice: json["total_price"],
        totalPriceAfterDiscount: json["total_price_after_discount"],
        deliveryAddressName: json["delivery_address_name"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
        paid: json["paid"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_price": deliveryPrice,
        "total_order": totalOrder,
        "total_price": totalPrice,
        "total_price_after_discount": totalPriceAfterDiscount,
        "delivery_address_name": deliveryAddressName,
        "latitude": latitude,
        "longitude": longitude,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
        "paid": paid,
        "status": status,
      };
}

class Detail {
  final String name;
  final int quantity;
  final double price;
  final String image;

  Detail({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  factory Detail.fromJson(dynamic json) {
    if (json is String) {
      final parts = json.split(' - ');
      final data = <String, String>{};

      for (var part in parts) {
        final keyValue = part.split(' : ');
        if (keyValue.length == 2) {
          data[keyValue[0].trim()] = keyValue[1].trim();
        }
      }

      String imageUrl = data['image'] ?? '';
      // Replace localhost with your machine's IP address
      imageUrl = imageUrl.replaceAll(
          'localhost', '127.0.0.1'); // Change to your local IP

      return Detail(
        name: data['food'] ?? 'Unknown',
        quantity: int.tryParse(data['quantity'] ?? '0') ?? 0,
        price: double.tryParse(data['price'] ?? '0') ?? 0.0,
        image: imageUrl,
      );
    }

    return Detail(
      name: json['name'] ?? 'Unknown',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        "image": image,
      };
}
