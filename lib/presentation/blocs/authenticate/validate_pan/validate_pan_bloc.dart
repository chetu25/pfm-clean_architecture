import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/validate_pan_model.dart';
import 'package:pfm_ekyc/domain/entities/validate_pan_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/validate_pan_number.dart';

part 'validate_pan_event.dart';
part 'validate_pan_state.dart';

@injectable
class ValidatePanBloc extends Bloc<ValidatePanEvent, ValidatePanState> {
  final ValidatePanNumber _validatePanNumber;
  ValidatePanBloc(this._validatePanNumber) : super(ValidatePanInitial()) {
    on<ValidatePan>(validatePanNumber);
    on<StateChanged>(changeToInitailState);
  }

  Future<void> validatePanNumber(
      ValidatePan event, Emitter<ValidatePanState> emit) async {
    emit(ValidatePanLoading());
    final result = await _validatePanNumber(event.params);

    result.fold(
        (l) => emit(
              ValidatePanFailure(errorType: l.errorType, errorMessage: l.error),
            ), (r) {
      emit(ValidatePanSuccess(r));
    });
  }

  void changeToInitailState(
      StateChanged event, Emitter<ValidatePanState> emit) {
    emit(ValidatePanInitial());
  }
}
