import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'owner_register_event.dart';
part 'owner_register_state.dart';

class OwnerRegisterBloc extends Bloc<OwnerRegisterEvent, OwnerRegisterState> {
  OwnerRegisterBloc() : super(OwnerRegisterInitial()) {
    on<OwnerRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
