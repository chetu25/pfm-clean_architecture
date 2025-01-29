part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

final class CheckConnectivity extends ConnectivityEvent {
  const CheckConnectivity();

  @override
  List<Object> get props => [];
}
