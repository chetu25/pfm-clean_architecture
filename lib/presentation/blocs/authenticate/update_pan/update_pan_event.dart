part of 'update_pan_bloc.dart';

abstract class UpdatePanEvent extends Equatable {
  const UpdatePanEvent();

  @override
  List<Object> get props => [];
}

class UpdatePan extends UpdatePanEvent {
  final ValidatePanParams params;
  const UpdatePan({required this.params});
  @override
  List<Object> get props => [];
}
