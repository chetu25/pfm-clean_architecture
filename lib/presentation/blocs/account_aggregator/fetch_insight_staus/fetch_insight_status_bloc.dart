import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/get_insight_status.dart';

part 'fetch_insight_status_event.dart';
part 'fetch_insight_status_state.dart';

@injectable
class FetchInsightStatusBloc
    extends Bloc<FetchInsightStatusEvent, FetchInsightStatusState> {
  final GetInsightStatus getInsightStatusl;
  FetchInsightStatusBloc(this.getInsightStatusl)
      : super(FetchInsightStatusInitial()) {
    on<GetStatusinsightEvent>(getStatus);
  }

  Future getStatus(GetStatusinsightEvent event,
      Emitter<FetchInsightStatusState> emit) async {
    emit(FetchInsightStatusLoading());
    final result = await getInsightStatusl(NoParams());
    result.fold(
      (l) => emit(
        FetchInsightStatusFailure(
            errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        FetchInsightStatusSuccess(consentStatusModel: r),
      ),
    );
  }
}
