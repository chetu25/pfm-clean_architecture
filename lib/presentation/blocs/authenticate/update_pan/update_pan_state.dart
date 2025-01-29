part of 'update_pan_bloc.dart';

abstract class UpdatePanState extends Equatable {
  const UpdatePanState();
}

class UpdatePanInitial extends UpdatePanState {
  @override
  List<Object> get props => [];
}

class UpdatePanLoading extends UpdatePanState {
  @override
  List<Object> get props => [];
}

class UpdatePanSuccess extends UpdatePanState {
  final UpdatePanModel updatePanModel;
  const UpdatePanSuccess(this.updatePanModel);
  @override
  List<Object> get props => [updatePanModel];
}

class UpdatePanFailure extends UpdatePanState {
  final AppErrorType errorType;
  final String? errorMessage;

  const UpdatePanFailure({required this.errorType, this.errorMessage});
  @override
  List<Object?> get props => [errorType, errorMessage];
}
