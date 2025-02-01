// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsentStatusModel _$ConsentStatusModelFromJson(Map<String, dynamic> json) =>
    ConsentStatusModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConsentStatusModelToJson(ConsentStatusModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      setuStatus: json['setu_status'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'setu_status': instance.setuStatus,
    };
