// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setu_consent_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetuConsentUrlModel _$SetuConsentUrlModelFromJson(Map<String, dynamic> json) =>
    SetuConsentUrlModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetuConsentUrlModelToJson(
        SetuConsentUrlModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'redirect_url': instance.redirectUrl,
    };
