// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_pan_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatePanParams _$ValidatePanParamsFromJson(Map<String, dynamic> json) =>
    ValidatePanParams(
      panNumber: json['pan_number'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$ValidatePanParamsToJson(ValidatePanParams instance) =>
    <String, dynamic>{
      'pan_number': instance.panNumber,
      'dob': instance.dob,
    };
