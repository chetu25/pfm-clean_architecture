// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLoginModel _$PhoneLoginModelFromJson(Map<String, dynamic> json) =>
    PhoneLoginModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhoneLoginModelToJson(PhoneLoginModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mobileOtpStatus: json['mobile_otp_status'] as String?,
      mobileOtpSentAt: json['mobile_otp_sent_at'] == null
          ? null
          : DateTime.parse(json['mobile_otp_sent_at'] as String),
      mobileOtpHits: (json['mobile_otp_hits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mobile_otp_status': instance.mobileOtpStatus,
      'mobile_otp_sent_at': instance.mobileOtpSentAt?.toIso8601String(),
      'mobile_otp_hits': instance.mobileOtpHits,
    };
