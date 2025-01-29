part of 'validate_pan_bloc.dart';

abstract class ValidatePanState extends Equatable {
  const ValidatePanState();
}

class ValidatePanInitial extends ValidatePanState {
  @override
  List<Object> get props => [];
}

class ValidatePanLoading extends ValidatePanState {
  @override
  List<Object> get props => [];
}

class ValidatePanSuccess extends ValidatePanState {
  final ValidatePanModel validatePanModel;
  const ValidatePanSuccess(this.validatePanModel);
  @override
  List<Object> get props => [validatePanModel];
}

class ValidatePanFailure extends ValidatePanState {
  final AppErrorType errorType;
  final String? errorMessage;
  const ValidatePanFailure(
      {required this.errorType, required this.errorMessage});
  @override
  List<Object?> get props => [errorType, errorMessage];
}
