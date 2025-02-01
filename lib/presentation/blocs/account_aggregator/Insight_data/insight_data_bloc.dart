import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/insight_details_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/get_insight_details.dart';

part 'insight_data_event.dart';
part 'insight_data_state.dart';

@injectable
class InsightDataBloc extends Bloc<InsightDataEvent, InsightDataState> {
  final GetInsightDetails getInsightDetails;
  InsightDataBloc(this.getInsightDetails) : super(InsightDataInitial()) {
    on<FetchInsightData>(getInsightData);
  }

  Future getInsightData(
      FetchInsightData event, Emitter<InsightDataState> emit) async {
    emit(InsightDataLoading());
    final result = await getInsightDetails(NoParams());
    result.fold(
      (l) => emit(
        InsightDataFailure(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        InsightDataLodded(insightDetailsModel: r),
      ),
    );
  }
}
