part of 'get_consent_url_bloc.dart';

abstract class GetConsentUrlEvent extends Equatable {
  const GetConsentUrlEvent();

  @override
  List<Object> get props => [];
}

class GetConsentLinkEvent extends GetConsentUrlEvent {
  @override
  List<Object> get props => [];
}
