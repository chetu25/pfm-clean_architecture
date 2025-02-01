part of 'fetch_consent_status_bloc.dart';

abstract class FetchConsentStatusEvent extends Equatable {
  const FetchConsentStatusEvent();

  @override
  List<Object> get props => [];
}

class GetStatusEvent extends FetchConsentStatusEvent {
  @override
  List<Object> get props => [];
}
