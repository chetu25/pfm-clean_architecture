import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/phone_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/phone_otp_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class ValidatePhoneOtp extends UseCase<PhoneOtpModel, PhoneOtpParams> {
  final AccountRepositories accountRepositories;

  ValidatePhoneOtp(this.accountRepositories);

  @override
  Future<Either<AppError, PhoneOtpModel>> call(PhoneOtpParams params) async =>
      await accountRepositories.verifyPhoneOtp(params.toJson());
}
