// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailOtpModel _$VerifyEmailOtpModelFromJson(Map<String, dynamic> json) =>
    VerifyEmailOtpModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$VerifyEmailOtpModelToJson(
        VerifyEmailOtpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
