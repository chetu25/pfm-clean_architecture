import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/stage_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/check_stages.dart';

part 'get_stage_event.dart';
part 'get_stage_state.dart';

@injectable
class GetStageBloc extends Bloc<GetStageEvent, GetStageState> {
  final CheckStages checkStages;
  GetStageBloc(this.checkStages) : super(GetStageInitial()) {
    on<GetStage>(fetchtStage);
  }

  Future fetchtStage(GetStage event, Emitter<GetStageState> emit) async {
    emit(GetStageLoading());
    final result = await checkStages(NoParams());
    result.fold(
      (l) => emit(
        GetStageFailure(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        GetStageSuccess(r),
      ),
    );
  }
}
