part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpEvent {}

class VerifyOtpRequestEvent extends VerifyOtpEvent {
  final String phoneNu;
  final String otpCode;

  VerifyOtpRequestEvent(this.phoneNu, this.otpCode);
}
