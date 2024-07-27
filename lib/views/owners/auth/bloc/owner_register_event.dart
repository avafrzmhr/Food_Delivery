part of 'owner_register_bloc.dart';

abstract class OwnerRegisterEvent {}

class SubmitOwnerRegisterEvent extends OwnerRegisterEvent {
  String name;
  String lastName;
  String phoneNumber;
  String email;
  String storeName;
  String storeType;
  String storeDesc;

  SubmitOwnerRegisterEvent(this.name, this.lastName, this.phoneNumber,
      this.email, this.storeName, this.storeType, this.storeDesc);

  List<Object?> get props => [name, lastName, phoneNumber];
}
