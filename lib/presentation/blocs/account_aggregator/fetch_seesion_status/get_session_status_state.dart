part of 'get_session_status_bloc.dart';

abstract class GetSessionStatusState extends Equatable {
  const GetSessionStatusState();
}

class GetSessionStatusInitial extends GetSessionStatusState {
  @override
  List<Object> get props => [];
}

class GetSessionStatusLoading extends GetSessionStatusState {
  @override
  List<Object> get props => [];
}

class GetSessionStatusSuccess extends GetSessionStatusState {
  final ConsentStatusModel consentStatusModel;
  const GetSessionStatusSuccess(this.consentStatusModel);
  @override
  List<Object> get props => [consentStatusModel];
}

class GetSessionStatusFailure extends GetSessionStatusState {
  final AppErrorType errorType;
  final String? errorMessage;

  const GetSessionStatusFailure({required this.errorType, this.errorMessage});
  @override
  List<Object?> get props => [errorType, errorMessage];
}
