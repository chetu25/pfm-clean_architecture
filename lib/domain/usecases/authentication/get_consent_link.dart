import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/setu_consent_url_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetConsentLink extends UseCase<SetuConsentUrlModel, NoParams> {
  final AccountRepositories accountRepositories;
  GetConsentLink(this.accountRepositories);
  @override
  Future<Either<AppError, SetuConsentUrlModel>> call(NoParams params) async =>
      await accountRepositories.getConsentUrl();
}
