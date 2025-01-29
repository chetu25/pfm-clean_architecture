import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/phone_login_model.dart';
import 'package:pfm_ekyc/domain/entities/phone_login_param.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetPhoneOtp extends UseCase<PhoneLoginModel, PhoneLoginParam> {
  final AccountRepositories accountRepositories;

  GetPhoneOtp(this.accountRepositories);

  @override
  Future<Either<AppError, PhoneLoginModel>> call(
          PhoneLoginParam params) async =>
      await accountRepositories.getPhoneOtp(params.toJson());
}
