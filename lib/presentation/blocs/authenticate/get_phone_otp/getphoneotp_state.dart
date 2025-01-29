part of 'getphoneotp_bloc.dart';

abstract class GetphoneotpState extends Equatable {
  const GetphoneotpState();
}

final class GetphoneotpInitial extends GetphoneotpState {
  @override
  List<Object> get props => [];
}

final class GetphoneotpLoading extends GetphoneotpState {
  const GetphoneotpLoading();

  @override
  List<Object> get props => [];
}

final class GetphoneotpSuccess extends GetphoneotpState {
  final PhoneLoginModel phoneLoginModel;

  const GetphoneotpSuccess(this.phoneLoginModel);

  @override
  List<Object> get props => [phoneLoginModel];
}

final class GetphoneotpFailure extends GetphoneotpState {
  final String? errorMessage;
  final AppErrorType errorType;

  const GetphoneotpFailure(
      {required this.errorType, required this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
