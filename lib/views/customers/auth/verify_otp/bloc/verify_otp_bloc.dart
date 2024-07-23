import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/providers.dart';
import 'package:meta/meta.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  AuthRepository authRepository;
  VerifyOtpBloc(this.authRepository) : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      if (event is VerifyOtpRequestEvent) {
        final res =
            await authRepository.verifyOtp(event.phoneNu, event.otpCode);
        if (res.statusCode == 200) {
          print(res);
          print(res.data);
          Providers.prefs.setString('refresh', res.data['refresh']);
          Providers.prefs.setString('access', res.data['access']);
          emit(VerifyOtpSuccess());
        } else {
          emit(VerifyOtpError(res.statusMessage.toString()));
        }
      }
    });
  }
}
