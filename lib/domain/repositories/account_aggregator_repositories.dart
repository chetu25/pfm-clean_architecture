import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';

abstract class AccountAggregatorRepositories {
  Future<Either<AppError, SetuConsentUrlModel>> getConsentUrl();
}
