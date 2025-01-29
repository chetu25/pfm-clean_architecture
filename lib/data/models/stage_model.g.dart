// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageModel _$StageModelFromJson(Map<String, dynamic> json) => StageModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StageModelToJson(StageModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      email: json['email'] as bool?,
      panNumber: json['pan_number'] as bool?,
      dob: json['dob'] as bool?,
      aaConsentStatus: json['aa_consent_status'] as String?,
      aaConsentDatetime: json['aa_consent_datetime'] == null
          ? null
          : DateTime.parse(json['aa_consent_datetime'] as String),
      aaSessionStatus: json['aa_session_status'] as String?,
      aaSessionDatetime: json['aa_session_datetime'] == null
          ? null
          : DateTime.parse(json['aa_session_datetime'] as String),
      aaInsightsStatus: json['aa_insights_status'] as String?,
      aaInsightsDatetime: json['aa_insights_datetime'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'email': instance.email,
      'pan_number': instance.panNumber,
      'dob': instance.dob,
      'aa_consent_status': instance.aaConsentStatus,
      'aa_consent_datetime': instance.aaConsentDatetime?.toIso8601String(),
      'aa_session_status': instance.aaSessionStatus,
      'aa_session_datetime': instance.aaSessionDatetime?.toIso8601String(),
      'aa_insights_status': instance.aaInsightsStatus,
      'aa_insights_datetime': instance.aaInsightsDatetime,
    };
