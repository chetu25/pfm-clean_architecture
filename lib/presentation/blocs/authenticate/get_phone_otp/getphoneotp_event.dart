part of 'getphoneotp_bloc.dart';

abstract class GetphoneotpEvent extends Equatable {
  const GetphoneotpEvent();

  @override
  List<Object> get props => [];
}

final class Phoneotp extends GetphoneotpEvent {
  final PhoneLoginParam param;

  const Phoneotp({required this.param});

  @override
  List<Object> get props => [param];
}

final class StateChange extends GetphoneotpEvent {
  @override
  List<Object> get props => [];
}
