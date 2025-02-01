import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/bank_acc_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/insight_details_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';

abstract class AccountAggregatorRepositories {
  Future<Either<AppError, SetuConsentUrlModel>> getConsentUrl();

  Future<Either<AppError, ConsentStatusModel>> getConsentStatus();

  Future<Either<AppError, ConsentStatusModel>> getSessionStatus();

  Future<Either<AppError, BankAccModel>> getBankData();

  Future<Either<AppError, ConsentStatusModel>> getInsightStatus();

  Future<Either<AppError, InsightDetailsModel>> getInsightInfo();
}
