// To parse this JSON data, do
//
//     final validatePanParams = validatePanParamsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'validate_pan_params.g.dart';

ValidatePanParams validatePanParamsFromJson(String str) =>
    ValidatePanParams.fromJson(json.decode(str));

String validatePanParamsToJson(ValidatePanParams data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ValidatePanParams {
  @JsonKey(name: "pan_number")
  final String? panNumber;
  @JsonKey(name: "dob")
  final String? dob;

  ValidatePanParams({
    this.panNumber,
    this.dob,
  });

  ValidatePanParams copyWith({
    String? panNumber,
    String? dob,
  }) =>
      ValidatePanParams(
        panNumber: panNumber ?? this.panNumber,
        dob: dob ?? this.dob,
      );

  factory ValidatePanParams.fromJson(Map<String, dynamic> json) =>
      _$ValidatePanParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ValidatePanParamsToJson(this);
}
