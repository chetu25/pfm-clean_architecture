part of 'fetch_insight_status_bloc.dart';

abstract class FetchInsightStatusState extends Equatable {
  const FetchInsightStatusState();
}

class FetchInsightStatusInitial extends FetchInsightStatusState {
  @override
  List<Object> get props => [];
}

class FetchInsightStatusLoading extends FetchInsightStatusState {
  @override
  List<Object> get props => [];
}

class FetchInsightStatusSuccess extends FetchInsightStatusState {
  final ConsentStatusModel consentStatusModel;

  const FetchInsightStatusSuccess({required this.consentStatusModel});
  @override
  List<Object> get props => [consentStatusModel];
}

class FetchInsightStatusFailure extends FetchInsightStatusState {
  final AppErrorType errorType;
  final String? errorMessage;

  const FetchInsightStatusFailure({
    required this.errorType,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorType, errorMessage];
}
