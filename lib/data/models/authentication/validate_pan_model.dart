// To parse this JSON data, do
//
//     final validatePanModel = validatePanModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'validate_pan_model.g.dart';

ValidatePanModel validatePanModelFromJson(String str) =>
    ValidatePanModel.fromJson(json.decode(str));

String validatePanModelToJson(ValidatePanModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ValidatePanModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ValidatePanModel({
    this.success,
    this.message,
    this.data,
  });

  ValidatePanModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ValidatePanModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ValidatePanModel.fromJson(Map<String, dynamic> json) =>
      _$ValidatePanModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValidatePanModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "number")
  final String? number;
  @JsonKey(name: "isValid")
  final bool? isValid;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "middleName")
  final String? middleName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "title")
  final String? title;

  Data({
    this.name,
    this.number,
    this.isValid,
    this.firstName,
    this.middleName,
    this.lastName,
    this.title,
  });

  Data copyWith({
    String? name,
    String? number,
    bool? isValid,
    String? firstName,
    String? middleName,
    String? lastName,
    String? title,
  }) =>
      Data(
        name: name ?? this.name,
        number: number ?? this.number,
        isValid: isValid ?? this.isValid,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        title: title ?? this.title,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
