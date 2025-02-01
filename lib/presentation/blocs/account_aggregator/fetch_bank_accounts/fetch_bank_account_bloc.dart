import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/bank_acc_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/account_aggregator/get_bank_account_details.dart';

part 'fetch_bank_account_event.dart';
part 'fetch_bank_account_state.dart';

@injectable
class FetchBankAccountBloc
    extends Bloc<FetchBankAccountEvent, FetchBankAccountState> {
  final GetBankAccountDetails getBankAccountDetails;
  FetchBankAccountBloc(this.getBankAccountDetails)
      : super(FetchBankAccountInitial()) {
    on<FetchBankEvent>(getBankDetails);
  }

  Future getBankDetails(
      FetchBankEvent event, Emitter<FetchBankAccountState> emit) async {
    emit(FetchBankAccountLoading());
    final result = await getBankAccountDetails(NoParams());
    result.fold(
      (l) => emit(
        FetchBankAccountFailure(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        FetchBankAccountSuccess(bankAccModel: r),
      ),
    );
  }
}
