// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_pan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatePanModel _$ValidatePanModelFromJson(Map<String, dynamic> json) =>
    ValidatePanModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidatePanModelToJson(ValidatePanModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      number: json['number'] as String?,
      isValid: json['isValid'] as bool?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'isValid': instance.isValid,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'title': instance.title,
    };
