part of 'verify_phone_otp_bloc.dart';

abstract class VerifyPhoneOtpEvent extends Equatable {
  const VerifyPhoneOtpEvent();

  @override
  List<Object> get props => [];
}

final class CheckphoneOtp extends VerifyPhoneOtpEvent {
  final PhoneOtpParams phoneOtpParam;
  const CheckphoneOtp({required this.phoneOtpParam});
  @override
  List<Object> get props => [];
}

final class Test extends VerifyPhoneOtpEvent {
  @override
  List<Object> get props => [];
}
