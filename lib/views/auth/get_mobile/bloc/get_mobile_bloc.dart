import 'package:bloc/bloc.dart';

part 'get_mobile_event.dart';
part 'get_mobile_state.dart';

class GetMobileBlocBloc extends Bloc<GetMobileEvent, GetMobileState> {
  GetMobileBlocBloc() : super(GetMobileInitial()) {
    on<GetMobileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
