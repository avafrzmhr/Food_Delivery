part of 'owner_register_bloc.dart';

sealed class OwnerRegisterState extends Equatable {
  const OwnerRegisterState();
  
  @override
  List<Object> get props => [];
}

final class OwnerRegisterInitial extends OwnerRegisterState {}
