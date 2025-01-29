part of 'verify_email_otp_bloc.dart';

abstract class VerifyEmailOtpEvent extends Equatable {
  const VerifyEmailOtpEvent();

  @override
  List<Object> get props => [];
}

final class CheckEmailOtp extends VerifyEmailOtpEvent {
  final VerifyEmailOtpParams verifyEmailOtpParams;
  const CheckEmailOtp({required this.verifyEmailOtpParams});
  @override
  List<Object> get props => [verifyEmailOtpParams];
}

final class ChangeState extends VerifyEmailOtpEvent {
  @override
  List<Object> get props => [];
}
