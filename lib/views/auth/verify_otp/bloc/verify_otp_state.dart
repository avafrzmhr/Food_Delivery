part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpState extends Equatable {}

class VerifyOtpInitial extends VerifyOtpState {
  @override
  List<Object?> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState {
  @override
  List<Object?> get props => [];
}

class VerifyOtpSuccess extends VerifyOtpState {
  VerifyOtpSuccess();

  @override
  List<Object?> get props => [];
}

class VerifyOtpError extends VerifyOtpState {
  final String message;

  VerifyOtpError(this.message);

  @override
  List<Object?> get props => [message];
}
