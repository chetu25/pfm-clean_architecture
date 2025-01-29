// To parse this JSON data, do
//
//     final getEmailOtpModel = getEmailOtpModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_email_otp_model.g.dart';

GetEmailOtpModel getEmailOtpModelFromJson(String str) =>
    GetEmailOtpModel.fromJson(json.decode(str));

String getEmailOtpModelToJson(GetEmailOtpModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetEmailOtpModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  GetEmailOtpModel({
    this.success,
    this.message,
    this.data,
  });

  GetEmailOtpModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetEmailOtpModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GetEmailOtpModel.fromJson(Map<String, dynamic> json) =>
      _$GetEmailOtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetEmailOtpModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "email_otp_status")
  final String? emailOtpStatus;
  @JsonKey(name: "email_otp_sent_at")
  final DateTime? emailOtpSentAt;
  @JsonKey(name: "email_otp_hits")
  final int? emailOtpHits;

  Data({
    this.emailOtpStatus,
    this.emailOtpSentAt,
    this.emailOtpHits,
  });

  Data copyWith({
    String? emailOtpStatus,
    DateTime? emailOtpSentAt,
    int? emailOtpHits,
  }) =>
      Data(
        emailOtpStatus: emailOtpStatus ?? this.emailOtpStatus,
        emailOtpSentAt: emailOtpSentAt ?? this.emailOtpSentAt,
        emailOtpHits: emailOtpHits ?? this.emailOtpHits,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
