import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/data_sources/local/token_local_data_source.dart';
import 'package:pfm_ekyc/data/models/authentication/phone_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/phone_otp_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/validate_phone_otp.dart';

part 'verify_phone_otp_event.dart';
part 'verify_phone_otp_state.dart';

@injectable
class VerifyPhoneOtpBloc
    extends Bloc<VerifyPhoneOtpEvent, VerifyPhoneOtpState> {
  final ValidatePhoneOtp _validatePhoneOtp;
  late final TokenLocalDataSource _tokenLocalDataSource;

  VerifyPhoneOtpBloc(this._validatePhoneOtp, this._tokenLocalDataSource)
      : super(VerifyPhoneOtpInitial()) {
    on<CheckphoneOtp>(_verifyOtp);
    on<Test>(resetOtp);
  }
  Future<void> resetOtp(Test event, Emitter<VerifyPhoneOtpState> emit) async {
    emit(VerifyPhoneOtpInitial());
  }

  Future _verifyOtp(
      CheckphoneOtp event, Emitter<VerifyPhoneOtpState> emit) async {
    emit(VerifyPhoneOtpLoading());
    final phoneOtp = await _validatePhoneOtp(event.phoneOtpParam);
    phoneOtp.fold(
        (l) => emit(
              VerifyPhoneOtpFailure(
                  errorType: l.errorType, errorMessage: l.error),
            ), (r) async {
      emit(
        VerifyPhoneOtpSuccess(r),
      );
      if (r.data != null) {
        await _tokenLocalDataSource.setToken(r.data?.token ?? '');
      }
    });
  }
}
