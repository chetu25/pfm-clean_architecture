part of 'get_email_otp_bloc.dart';

abstract class GetEmailOtpEvent extends Equatable {
  const GetEmailOtpEvent();

  @override
  List<Object> get props => [];
}

final class Emailotp extends GetEmailOtpEvent {
  final GetEmailOtpparams param;

  const Emailotp({required this.param});

  @override
  List<Object> get props => [param];
}

final class GoogleSign extends GetEmailOtpEvent {
  @override
  List<Object> get props => [];
}

final class StateChange extends GetEmailOtpEvent {
  @override
  List<Object> get props => [];
}
