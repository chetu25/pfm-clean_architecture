part of 'get_session_status_bloc.dart';

abstract class GetSessionStatusEvent extends Equatable {
  const GetSessionStatusEvent();

  @override
  List<Object> get props => [];
}

class CheckSessionStatus extends GetSessionStatusEvent {
  @override
  List<Object> get props => [];
}
