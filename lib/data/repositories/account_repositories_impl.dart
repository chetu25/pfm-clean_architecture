import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/api/api_call_with_error.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/data_sources/remote/account_remote_data_source.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/data/models/authentication/setu_consent_url_model.dart';
import 'package:pfm_ekyc/data/models/get_email_otp_model.dart';
import 'package:pfm_ekyc/data/models/phone_login_model.dart';
import 'package:pfm_ekyc/data/models/phone_otp_model.dart';
import 'package:pfm_ekyc/data/models/stage_model.dart';
import 'package:pfm_ekyc/data/models/update_pan_model.dart';
import 'package:pfm_ekyc/data/models/validate_pan_model.dart';
import 'package:pfm_ekyc/data/models/verify_email_otp_model.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';

@LazySingleton(as: AccountRepositories)
class AccountRepositoriesImpl implements AccountRepositories {
  late final AccountRemoteDataSource _accountRemoteDataSource;
  AccountRepositoriesImpl(this._accountRemoteDataSource);

  @override
  Future<Either<AppError, PhoneLoginModel>> getPhoneOtp(
      Map<String, dynamic> params) async {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.getPhoneOtp(params));
  }

  @override
  Future<Either<AppError, PhoneOtpModel>> verifyPhoneOtp(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.checkPhoneOtp(params));
  }

  @override
  Future<Either<AppError, GetEmailOtpModel>> getMailOtp(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.getEmailOtp(params));
  }

  @override
  Future<Either<AppError, VerifyEmailOtpModel>> verifyMaliOtp(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.checkEmailOtp(params));
  }

  @override
  Future<Either<AppError, ValidatePanModel>> varifyPanNumber(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.verifyPan(params));
  }

  @override
  Future<Either<AppError, UpdatePanModel>> updatePanNumber(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.updatePan(params));
  }

  @override
  Future<Either<AppError, StageModel>> getStages() {
    return ApiCallWithError.call(() => _accountRemoteDataSource.getStage());
  }

  @override
  Future<Either<AppError, ProfileModel>> fetchProfileData() {
    return ApiCallWithError.call(() => _accountRemoteDataSource.fetchProfile());
  }

  @override
  Future<Either<AppError, SetuConsentUrlModel>> getConsentUrl() {
    return ApiCallWithError.call(
        () => _accountRemoteDataSource.fetchConsentUrl());
  }
}
