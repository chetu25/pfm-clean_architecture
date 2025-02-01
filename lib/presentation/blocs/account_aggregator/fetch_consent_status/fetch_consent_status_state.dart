part of 'fetch_consent_status_bloc.dart';

abstract class FetchConsentStatusState extends Equatable {
  const FetchConsentStatusState();
}

class FetchConsentStatusInitial extends FetchConsentStatusState {
  @override
  List<Object> get props => [];
}

class FetchConsentStatusLoading extends FetchConsentStatusState {
  @override
  List<Object> get props => [];
}

class FetchConsentStatusSuccess extends FetchConsentStatusState {
  final ConsentStatusModel consentStatusModel;
  const FetchConsentStatusSuccess(this.consentStatusModel);

  @override
  List<Object> get props => [consentStatusModel];
}

class FetchConsentStatusFailure extends FetchConsentStatusState {
  final AppErrorType errorType;
  final String? errorMessage;

  const FetchConsentStatusFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
