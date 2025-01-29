part of 'get_consent_url_bloc.dart';

abstract class GetConsentUrlState extends Equatable {
  const GetConsentUrlState();
}

class GetConsentUrlInitial extends GetConsentUrlState {
  @override
  List<Object> get props => [];
}

class GetConsentUrlLoading extends GetConsentUrlState {
  @override
  List<Object> get props => [];
}

class GetConsentUrlSuccess extends GetConsentUrlState {
  final SetuConsentUrlModel setuConsentUrlModel;

  const GetConsentUrlSuccess(this.setuConsentUrlModel);
  @override
  List<Object> get props => [setuConsentUrlModel];
}

class GetConsentUrlFailure extends GetConsentUrlState {
  final AppErrorType errorType;
  final String? errorMessage;

  const GetConsentUrlFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
