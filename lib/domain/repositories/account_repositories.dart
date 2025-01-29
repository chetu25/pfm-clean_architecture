import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/data/models/authentication/get_email_otp_model.dart';
import 'package:pfm_ekyc/data/models/authentication/phone_login_model.dart';
import 'package:pfm_ekyc/data/models/authentication/phone_otp_model.dart';
import 'package:pfm_ekyc/data/models/authentication/stage_model.dart';
import 'package:pfm_ekyc/data/models/authentication/update_pan_model.dart';
import 'package:pfm_ekyc/data/models/authentication/validate_pan_model.dart';
import 'package:pfm_ekyc/data/models/authentication/verify_email_otp_model.dart';

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
}
