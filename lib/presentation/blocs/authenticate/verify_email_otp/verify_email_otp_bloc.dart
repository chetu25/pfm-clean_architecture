import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/verify_email_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/verify_email_otp_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/vallidate_email_otp.dart';

part 'verify_email_otp_event.dart';
part 'verify_email_otp_state.dart';

@injectable
class VerifyEmailOtpBloc
    extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  final VallidateEmailOtp vallidateEmailOtp;
  VerifyEmailOtpBloc(this.vallidateEmailOtp) : super(VerifyEmailOtpInitial()) {
    on<CheckEmailOtp>(_verifyMailOtp);
    on<ChangeState>(changeToInitailState);
  }

  Future _verifyMailOtp(
      CheckEmailOtp event, Emitter<VerifyEmailOtpState> emit) async {
    emit(VerifyEmailOtpLoading());
    final result = await vallidateEmailOtp(event.verifyEmailOtpParams);

    result.fold(
        (l) => emit(
              VerifyEmailOtpFailure(
                  errorType: l.errorType, errorMessage: l.error),
            ), (r) {
      emit(VerifyEmailOtpSuccess(r));
    });
  }

  void changeToInitailState(
      ChangeState event, Emitter<VerifyEmailOtpState> emit) {
    emit(VerifyEmailOtpInitial());
  }
}
