part of 'verify_email_otp_bloc.dart';

abstract class VerifyEmailOtpState extends Equatable {
  const VerifyEmailOtpState();
}

class VerifyEmailOtpInitial extends VerifyEmailOtpState {
  @override
  List<Object> get props => [];
}

class VerifyEmailOtpLoading extends VerifyEmailOtpState {
  @override
  List<Object> get props => [];
}

class VerifyEmailOtpSuccess extends VerifyEmailOtpState {
  final VerifyEmailOtpModel verifyEmailOtpModel;

  const VerifyEmailOtpSuccess(this.verifyEmailOtpModel);

  @override
  List<Object> get props => [verifyEmailOtpModel];
}

class VerifyEmailOtpFailure extends VerifyEmailOtpState {
  final AppErrorType errorType;
  final String? errorMessage;

  const VerifyEmailOtpFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
