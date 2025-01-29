import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/api/api_client.dart';
import 'package:pfm_ekyc/api/api_constants.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';

abstract class AccountAggregatorRemoteDataSource {
  Future<SetuConsentUrlModel> fetchConsentUrl();
}

@LazySingleton(as: AccountAggregatorRemoteDataSource)
class AccountAggregatorRemoteDataSourceImpl
    implements AccountAggregatorRemoteDataSource {
  final ApiClient _client;
  AccountAggregatorRemoteDataSourceImpl(this._client);

  @override
  Future<SetuConsentUrlModel> fetchConsentUrl() async {
    final response = await _client.get(ApiConstants.getConsentUrl);
    return SetuConsentUrlModel.fromJson(response);
  }
}
