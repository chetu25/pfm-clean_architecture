part of 'validate_pan_bloc.dart';

abstract class ValidatePanEvent extends Equatable {
  const ValidatePanEvent();

  @override
  List<Object> get props => [];
}

class ValidatePan extends ValidatePanEvent {
  final ValidatePanParams params;

  const ValidatePan(this.params);
  @override
  List<Object> get props => [params];
}

class StateChanged extends ValidatePanEvent {
  @override
  List<Object> get props => [];
}
