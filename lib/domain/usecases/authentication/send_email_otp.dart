import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/get_email_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/get_email_otp_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class SendEmailOtp extends UseCase<GetEmailOtpModel, GetEmailOtpparams> {
  final AccountRepositories accountRepositories;

  SendEmailOtp(this.accountRepositories);

  @override
  Future<Either<AppError, GetEmailOtpModel>> call(
          GetEmailOtpparams params) async =>
      await accountRepositories.getMailOtp(params.toJson());
}
