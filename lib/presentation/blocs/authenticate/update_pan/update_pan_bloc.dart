import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/update_pan_model.dart';
import 'package:pfm_ekyc/domain/entities/validate_pan_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/submit_pan.dart';

part 'update_pan_event.dart';
part 'update_pan_state.dart';

@injectable
class UpdatePanBloc extends Bloc<UpdatePanEvent, UpdatePanState> {
  final SubmitPan _submitPan;
  UpdatePanBloc(this._submitPan) : super(UpdatePanInitial()) {
    on<UpdatePan>(updatePanNumber);
  }

  Future<void> updatePanNumber(
      UpdatePan event, Emitter<UpdatePanState> emit) async {
    emit(UpdatePanLoading());
    final result = await _submitPan(event.params);

    result.fold(
        (l) => emit(
              UpdatePanFailure(errorType: l.errorType, errorMessage: l.error),
            ), (r) {
      emit(UpdatePanSuccess(r));
    });
  }
}
