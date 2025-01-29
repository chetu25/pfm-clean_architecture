import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/get_email_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/get_email_otp_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/send_email_otp.dart';

part 'get_email_otp_event.dart';
part 'get_email_otp_state.dart';

@injectable
class GetEmailOtpBloc extends Bloc<GetEmailOtpEvent, GetEmailOtpState> {
  final SendEmailOtp sendEmailOtp;
  GetEmailOtpBloc(this.sendEmailOtp) : super(GetEmailOtpInitial()) {
    on<Emailotp>(requestEmailOtp);
    on<StateChange>(changeToInitailState);
  }

  Future<void> requestEmailOtp(
      Emailotp event, Emitter<GetEmailOtpState> emit) async {
    emit(GetEmailOtpLoading());

    final response = await sendEmailOtp(event.param);

    response.fold((l) {
      emit(
        GetEmailOtpFailure(errorType: l.errorType, errorMessage: l.error),
      );
    }, (r) {
      emit(GetEmailOtpSuccess(r));
    });
  }

  void changeToInitailState(StateChange event, Emitter<GetEmailOtpState> emit) {
    emit(GetEmailOtpInitial());
  }
}
