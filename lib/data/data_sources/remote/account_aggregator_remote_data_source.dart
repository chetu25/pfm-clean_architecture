import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:pfm_ekyc/api/api_client.dart';
import 'package:pfm_ekyc/api/api_constants.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/bank_acc_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/insight_details_model.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/setu_consent_url_model.dart';

abstract class AccountAggregatorRemoteDataSource {
  Future<SetuConsentUrlModel> fetchConsentUrl();

  Future<ConsentStatusModel> getConsentStatus();

  Future<ConsentStatusModel> getSessionStatus();

  Future<BankAccModel> getBankAccounts();

  Future<ConsentStatusModel> getInsightStatus();

  Future<InsightDetailsModel> getInsightDetails();
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

  @override
  Future<ConsentStatusModel> getConsentStatus() async {
    final response = await _client.get(ApiConstants.getConsentStatusUrl);
    return ConsentStatusModel.fromJson(response);
  }

  @override
  Future<ConsentStatusModel> getSessionStatus() async {
    final response =
        await _client.get(ApiConstants.getSessiontUrl, queryParameters: {
      "from":
          "${DateTime.now().year - 1}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
      "to": DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
    });
    return ConsentStatusModel.fromJson(response);
  }

  @override
  Future<BankAccModel> getBankAccounts() async {
    final response = await _client.get(ApiConstants.getBankAccountsUrl);
    return BankAccModel.fromJson(response);
  }

  @override
  Future<ConsentStatusModel> getInsightStatus() async {
    final response = await _client.get(ApiConstants.insightStatusUrl);
    return ConsentStatusModel.fromJson(response);
  }

  @override
  Future<InsightDetailsModel> getInsightDetails() async {
    final response = await _client.get(ApiConstants.insightDataUrl);
    return InsightDetailsModel.fromJson(response);
  }
}
