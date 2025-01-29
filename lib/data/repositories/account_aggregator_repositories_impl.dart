import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/api/api_call_with_error.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/data_sources/remote/account_aggregator_remote_data_source.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';
import 'package:pfm_ekyc/domain/repositories/account_aggregator_repositories.dart';

@LazySingleton(as: AccountAggregatorRepositories)
class AccountAggregatorRepositoriesImpl extends AccountAggregatorRepositories {
  late final AccountAggregatorRemoteDataSource
      _accountAggregatorRemoteDataSource;

  AccountAggregatorRepositoriesImpl(this._accountAggregatorRemoteDataSource);

  @override
  Future<Either<AppError, SetuConsentUrlModel>> getConsentUrl() {
    return ApiCallWithError.call(
        () => _accountAggregatorRemoteDataSource.fetchConsentUrl());
  }
}
