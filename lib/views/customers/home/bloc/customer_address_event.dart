part of 'customer_address_bloc.dart';

@immutable
abstract class CustomerAddressEvent {}

class CustomerAddressRequestEvent extends CustomerAddressEvent {
  final String addressName;
  final double lat;
  final double long;

  CustomerAddressRequestEvent(this.addressName, this.lat, this.long);
}
