import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/fetch_seeion.dart';

part 'get_session_status_event.dart';
part 'get_session_status_state.dart';

@injectable
class GetSessionStatusBloc
    extends Bloc<GetSessionStatusEvent, GetSessionStatusState> {
  final FetchSeeion fetchSeeion;
  GetSessionStatusBloc(this.fetchSeeion) : super(GetSessionStatusInitial()) {
    on<CheckSessionStatus>(getSeesionStatus);
  }

  Future getSeesionStatus(
      CheckSessionStatus event, Emitter<GetSessionStatusState> emit) async {
    emit(GetSessionStatusLoading());
    final result = await fetchSeeion(NoParams());
    result.fold(
      (l) => emit(
        GetSessionStatusFailure(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        GetSessionStatusSuccess(r),
      ),
    );
  }
}
