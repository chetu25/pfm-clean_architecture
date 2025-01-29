// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePanModel _$UpdatePanModelFromJson(Map<String, dynamic> json) =>
    UpdatePanModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$UpdatePanModelToJson(UpdatePanModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
