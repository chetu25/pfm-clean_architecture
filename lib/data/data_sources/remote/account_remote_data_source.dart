import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/api/api_client.dart';
import 'package:pfm_ekyc/api/api_constants.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/data/models/authentication/setu_consent_url_model.dart';
import 'package:pfm_ekyc/data/models/get_email_otp_model.dart';
import 'package:pfm_ekyc/data/models/phone_login_model.dart';
import 'package:pfm_ekyc/data/models/phone_otp_model.dart';
import 'package:pfm_ekyc/data/models/stage_model.dart';
import 'package:pfm_ekyc/data/models/update_pan_model.dart';
import 'package:pfm_ekyc/data/models/validate_pan_model.dart';
import 'package:pfm_ekyc/data/models/verify_email_otp_model.dart';

abstract class AccountRemoteDataSource {
  Future<PhoneLoginModel> getPhoneOtp(Map<String, dynamic> params);

  Future<PhoneOtpModel> checkPhoneOtp(Map<String, dynamic> params);

  Future<GetEmailOtpModel> getEmailOtp(Map<String, dynamic> params);

  Future<VerifyEmailOtpModel> checkEmailOtp(Map<String, dynamic> params);

  Future<ValidatePanModel> verifyPan(Map<String, dynamic> params);

  Future<UpdatePanModel> updatePan(Map<String, dynamic> params);

  Future<StageModel> getStage();

  Future<ProfileModel> fetchProfile();

  Future<SetuConsentUrlModel> fetchConsentUrl();
}

@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final ApiClient _client;

  AccountRemoteDataSourceImpl(this._client);

  @override
  Future<PhoneLoginModel> getPhoneOtp(Map<String, dynamic> params) async {
    final response = await _client.post(ApiConstants.phoneLogin,
        requiresToken: false, params: params);
    return PhoneLoginModel.fromJson(response);
  }

  @override
  Future<PhoneOtpModel> checkPhoneOtp(Map<String, dynamic> params) async {
    final response = await _client.post(ApiConstants.otpValidateUrl,
        params: params, requiresToken: false);
    return PhoneOtpModel.fromJson(response);
  }

  @override
  Future<GetEmailOtpModel> getEmailOtp(Map<String, dynamic> params) async {
    final response =
        await _client.post(ApiConstants.sendEmailOtp, params: params);
    return GetEmailOtpModel.fromJson(response);
  }

  @override
  Future<VerifyEmailOtpModel> checkEmailOtp(Map<String, dynamic> params) async {
    final response =
        await _client.post(ApiConstants.validatEmailOTP, params: params);
    return VerifyEmailOtpModel.fromJson(response);
  }

  @override
  Future<UpdatePanModel> updatePan(Map<String, dynamic> params) async {
    final response = await _client.post(ApiConstants.updatePan, params: params);
    return UpdatePanModel.fromJson(response);
  }

  @override
  Future<ValidatePanModel> verifyPan(Map<String, dynamic> params) async {
    final response =
        await _client.post(ApiConstants.validatePan, params: params);
    return ValidatePanModel.fromJson(response);
  }

  @override
  Future<StageModel> getStage() async {
    final response = await _client.get(ApiConstants.stageCheck);
    return StageModel.fromJson(response);
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    final response = await _client.post(ApiConstants.profileUrl);
    return ProfileModel.fromJson(response);
  }

  @override
  Future<SetuConsentUrlModel> fetchConsentUrl() async {
    final response = await _client.get(ApiConstants.getConsentUrl);
    return SetuConsentUrlModel.fromJson(response);
  }
}
