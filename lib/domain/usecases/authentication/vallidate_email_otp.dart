import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/verify_email_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/verify_email_otp_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class VallidateEmailOtp
    extends UseCase<VerifyEmailOtpModel, VerifyEmailOtpParams> {
  final AccountRepositories accountRepositories;

  VallidateEmailOtp(this.accountRepositories);
  @override
  Future<Either<AppError, VerifyEmailOtpModel>> call(
          VerifyEmailOtpParams params) async =>
      await accountRepositories.verifyMaliOtp(params.toJson());
}
