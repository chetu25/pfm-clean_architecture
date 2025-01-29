// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneOtpModel _$PhoneOtpModelFromJson(Map<String, dynamic> json) =>
    PhoneOtpModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhoneOtpModelToJson(PhoneOtpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      aliceblueClient: json['aliceblue_client'] as String?,
      getClientDetails: json['get_client_details'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'aliceblue_client': instance.aliceblueClient,
      'get_client_details': instance.getClientDetails,
    };
