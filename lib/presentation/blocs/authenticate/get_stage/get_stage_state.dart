part of 'get_stage_bloc.dart';

abstract class GetStageState extends Equatable {
  const GetStageState();
}

class GetStageInitial extends GetStageState {
  @override
  List<Object> get props => [];
}

class GetStageLoading extends GetStageState {
  @override
  List<Object> get props => [];
}

class GetStageSuccess extends GetStageState {
  final StageModel stageModel;
  const GetStageSuccess(this.stageModel);
  @override
  List<Object> get props => [stageModel];
}

class GetStageFailure extends GetStageState {
  final AppErrorType errorType;
  final String? errorMessage;

  const GetStageFailure({required this.errorMessage, required this.errorType});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
