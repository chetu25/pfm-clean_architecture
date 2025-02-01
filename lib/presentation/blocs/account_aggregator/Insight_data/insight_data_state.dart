part of 'insight_data_bloc.dart';

abstract class InsightDataState extends Equatable {
  const InsightDataState();
}

class InsightDataInitial extends InsightDataState {
  @override
  List<Object> get props => [];
}

class InsightDataLoading extends InsightDataState {
  @override
  List<Object> get props => [];
}

class InsightDataLodded extends InsightDataState {
  final InsightDetailsModel insightDetailsModel;

  const InsightDataLodded({required this.insightDetailsModel});
  @override
  List<Object> get props => [insightDetailsModel];
}

class InsightDataFailure extends InsightDataState {
  final AppErrorType errorType;
  final String? errorMessage;

  const InsightDataFailure({required this.errorType, this.errorMessage});
  @override
  List<Object?> get props => [errorType, errorMessage];
}
