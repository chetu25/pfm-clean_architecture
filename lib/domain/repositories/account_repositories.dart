import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/data/models/authentication/setu_consent_url_model.dart';
import 'package:pfm_ekyc/data/models/get_email_otp_model.dart';
import 'package:pfm_ekyc/data/models/phone_login_model.dart';
import 'package:pfm_ekyc/data/models/phone_otp_model.dart';
import 'package:pfm_ekyc/data/models/stage_model.dart';
import 'package:pfm_ekyc/data/models/update_pan_model.dart';
import 'package:pfm_ekyc/data/models/validate_pan_model.dart';
import 'package:pfm_ekyc/data/models/verify_email_otp_model.dart';

abstract class AccountRepositories {
  Future<Either<AppError, PhoneLoginModel>> getPhoneOtp(
      Map<String, dynamic> params);

  Future<Either<AppError, PhoneOtpModel>> verifyPhoneOtp(
      Map<String, dynamic> params);

  Future<Either<AppError, GetEmailOtpModel>> getMailOtp(
      Map<String, dynamic> params);

  Future<Either<AppError, VerifyEmailOtpModel>> verifyMaliOtp(
      Map<String, dynamic> params);

  Future<Either<AppError, ValidatePanModel>> varifyPanNumber(
      Map<String, dynamic> params);

  Future<Either<AppError, UpdatePanModel>> updatePanNumber(
      Map<String, dynamic> params);

  Future<Either<AppError, StageModel>> getStages();

  Future<Either<AppError, ProfileModel>> fetchProfileData();

  Future<Either<AppError, SetuConsentUrlModel>> getConsentUrl();
}
