import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/fetch_consent_status.dart';

part 'fetch_consent_status_event.dart';
part 'fetch_consent_status_state.dart';

@injectable
class FetchConsentStatusBloc
    extends Bloc<FetchConsentStatusEvent, FetchConsentStatusState> {
  final FetchConsentStatus fetchConsentStatus;
  FetchConsentStatusBloc(this.fetchConsentStatus)
      : super(FetchConsentStatusInitial()) {
    on<GetStatusEvent>(getStatus);
  }

  Future getStatus(
      GetStatusEvent event, Emitter<FetchConsentStatusState> emit) async {
    emit(FetchConsentStatusLoading());
    final result = await fetchConsentStatus(NoParams());
    result.fold(
      (l) => emit(
        FetchConsentStatusFailure(
            errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        FetchConsentStatusSuccess(r),
      ),
    );
  }
}
