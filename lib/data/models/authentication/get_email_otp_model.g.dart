// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_email_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmailOtpModel _$GetEmailOtpModelFromJson(Map<String, dynamic> json) =>
    GetEmailOtpModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetEmailOtpModelToJson(GetEmailOtpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      emailOtpStatus: json['email_otp_status'] as String?,
      emailOtpSentAt: json['email_otp_sent_at'] == null
          ? null
          : DateTime.parse(json['email_otp_sent_at'] as String),
      emailOtpHits: (json['email_otp_hits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'email_otp_status': instance.emailOtpStatus,
      'email_otp_sent_at': instance.emailOtpSentAt?.toIso8601String(),
      'email_otp_hits': instance.emailOtpHits,
    };
