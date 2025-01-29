part of 'verify_phone_otp_bloc.dart';

abstract class VerifyPhoneOtpState extends Equatable {
  const VerifyPhoneOtpState();
}

final class VerifyPhoneOtpInitial extends VerifyPhoneOtpState {
  @override
  List<Object> get props => [];
}

final class VerifyPhoneOtpLoading extends VerifyPhoneOtpState {
  @override
  List<Object> get props => [];
}

final class VerifyPhoneOtpSuccess extends VerifyPhoneOtpState {
  final PhoneOtpModel phoneOtpModel;
  const VerifyPhoneOtpSuccess(this.phoneOtpModel);
  @override
  List<Object> get props => [phoneOtpModel];
}

final class VerifyPhoneOtpFailure extends VerifyPhoneOtpState {
  final String? errorMessage;
  final AppErrorType errorType;

  const VerifyPhoneOtpFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
