part of 'get_email_otp_bloc.dart';

abstract class GetEmailOtpState extends Equatable {
  const GetEmailOtpState();
}

class GetEmailOtpInitial extends GetEmailOtpState {
  @override
  List<Object> get props => [];
}

class GetEmailOtpLoading extends GetEmailOtpState {
  @override
  List<Object> get props => [];
}

class GetEmailOtpSuccess extends GetEmailOtpState {
  final GetEmailOtpModel getEmailOtpModel;

  const GetEmailOtpSuccess(this.getEmailOtpModel);
  @override
  List<Object> get props => [getEmailOtpModel];
}

class GetEmailOtpFailure extends GetEmailOtpState {
  final AppErrorType errorType;
  final String? errorMessage;

  const GetEmailOtpFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}

class LoginWithGoogleLoading extends GetEmailOtpState {
  @override
  List<Object> get props => [];
}

class LoginWithGoogleSuccess extends GetEmailOtpState {
  final GoogleSignInAccount googleSignInAccount;
  final String accessToken;

  const LoginWithGoogleSuccess({
    required this.googleSignInAccount,
    required this.accessToken,
  });

  @override
  List<Object> get props => [googleSignInAccount, accessToken];
}

class LoginWithGoogleFailure extends GetEmailOtpState {
  final String error;

  const LoginWithGoogleFailure({
    required this.error,
  });
  @override
  List<Object> get props => [];
}
