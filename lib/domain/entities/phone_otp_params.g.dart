// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_otp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneOtpParams _$PhoneOtpParamsFromJson(Map<String, dynamic> json) =>
    PhoneOtpParams(
      mobileNumber: json['mobile_number'] as String,
      mobileOtp: json['mobile_otp'] as String,
    );

Map<String, dynamic> _$PhoneOtpParamsToJson(PhoneOtpParams instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobileNumber,
      'mobile_otp': instance.mobileOtp,
    };
