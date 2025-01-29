// To parse this JSON data, do
//
//     final verifyEmailOtpModel = verifyEmailOtpModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'verify_email_otp_model.g.dart';

VerifyEmailOtpModel verifyEmailOtpModelFromJson(String str) =>
    VerifyEmailOtpModel.fromJson(json.decode(str));

String verifyEmailOtpModelToJson(VerifyEmailOtpModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class VerifyEmailOtpModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<dynamic>? data;

  VerifyEmailOtpModel({
    this.success,
    this.message,
    this.data,
  });

  VerifyEmailOtpModel copyWith({
    bool? success,
    String? message,
    List<dynamic>? data,
  }) =>
      VerifyEmailOtpModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VerifyEmailOtpModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailOtpModelToJson(this);
}
