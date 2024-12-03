part of 'add_restaurant_bloc.dart';

@immutable
abstract class AddRestaurantEvent extends Equatable {
  const AddRestaurantEvent();
}

class AddRestaurantRequestEvent extends AddRestaurantEvent {
  final Uint8List image; // Use Uint8List for cross-platform compatibility
  final String category;
  final String deliveryTime;
  final double minCartPrice;
  final double deliveryPrice;
  final String name;
  final String phoneNumber;
  final String openTime;
  final String closeTime;
  final String address;
  final double lat;
  final double long;

  const AddRestaurantRequestEvent(
    this.image,
    this.category,
    this.deliveryTime,
    this.minCartPrice,
    this.deliveryPrice,
    this.name,
    this.phoneNumber,
    this.openTime,
    this.closeTime,
    this.address,
    this.lat,
    this.long,
  );

  @override
  List<Object?> get props => [
        image,
        category,
        deliveryTime,
        minCartPrice,
        deliveryPrice,
        name,
        phoneNumber,
        openTime,
        closeTime,
        address,
        lat,
        long,
      ];
}
