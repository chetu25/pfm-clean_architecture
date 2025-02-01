// To parse this JSON data, do
//
//     final consentStatusModel = consentStatusModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'consent_status_model.g.dart';

ConsentStatusModel consentStatusModelFromJson(String str) =>
    ConsentStatusModel.fromJson(json.decode(str));

String consentStatusModelToJson(ConsentStatusModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ConsentStatusModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ConsentStatusModel({
    this.success,
    this.message,
    this.data,
  });

  ConsentStatusModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ConsentStatusModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ConsentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ConsentStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsentStatusModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "setu_status")
  final String? setuStatus;

  Data({
    this.setuStatus,
  });

  Data copyWith({
    String? setuStatus,
  }) =>
      Data(
        setuStatus: setuStatus ?? this.setuStatus,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
