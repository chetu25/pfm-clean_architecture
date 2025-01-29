import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/phone_login_model.dart';
import 'package:pfm_ekyc/domain/entities/phone_login_param.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/get_phone_otp.dart';

part 'getphoneotp_event.dart';
part 'getphoneotp_state.dart';

@injectable
class GetphoneotpBloc extends Bloc<GetphoneotpEvent, GetphoneotpState> {
  final GetPhoneOtp _getPhoneOtp;
  GetphoneotpBloc(this._getPhoneOtp) : super(GetphoneotpInitial()) {
    on<Phoneotp>(phoneOtp);
    on<StateChange>(changeToInitailState);
  }

  Future<void> phoneOtp(
    Phoneotp event,
    Emitter<GetphoneotpState> emit,
  ) async {
    emit(GetphoneotpLoading());

    final response = await _getPhoneOtp(event.param);

    response.fold((l) {
      emit(
        GetphoneotpFailure(errorType: l.errorType, errorMessage: l.error),
      );
    }, (r) {
      emit(GetphoneotpSuccess(r));
    });
  }

  void changeToInitailState(
    StateChange event,
    Emitter<GetphoneotpState> emit,
  ) {
    emit(GetphoneotpInitial());
  }
}
