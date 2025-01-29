import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/get_consent_link.dart';

part 'get_consent_url_event.dart';
part 'get_consent_url_state.dart';

@injectable
class GetConsentUrlBloc extends Bloc<GetConsentUrlEvent, GetConsentUrlState> {
  final GetConsentLink getConsentUrl;
  GetConsentUrlBloc(this.getConsentUrl) : super(GetConsentUrlInitial()) {
    on<GetConsentLinkEvent>(fetchSetuConsentUrl);
  }

  Future fetchSetuConsentUrl(
      GetConsentLinkEvent event, Emitter<GetConsentUrlState> emit) async {
    emit(GetConsentUrlLoading());
    final result = await getConsentUrl(NoParams());
    result.fold(
      (l) => emit(
        GetConsentUrlFailure(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        GetConsentUrlSuccess(r),
      ),
    );
  }
}
