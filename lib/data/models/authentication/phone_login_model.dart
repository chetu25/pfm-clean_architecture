// To parse this JSON data, do
//
//     final phoneLoginModel = phoneLoginModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'phone_login_model.g.dart';

PhoneLoginModel phoneLoginModelFromJson(String str) =>
    PhoneLoginModel.fromJson(json.decode(str));

String phoneLoginModelToJson(PhoneLoginModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PhoneLoginModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  PhoneLoginModel({
    required this.success,
    required this.message,
    required this.data,
  });

  PhoneLoginModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      PhoneLoginModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PhoneLoginModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneLoginModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "mobile_otp_status")
  final String? mobileOtpStatus;
  @JsonKey(name: "mobile_otp_sent_at")
  final DateTime? mobileOtpSentAt;
  @JsonKey(name: "mobile_otp_hits")
  final int? mobileOtpHits;

  Data({
    required this.mobileOtpStatus,
    required this.mobileOtpSentAt,
    required this.mobileOtpHits,
  });

  Data copyWith({
    String? mobileOtpStatus,
    DateTime? mobileOtpSentAt,
    int? mobileOtpHits,
  }) =>
      Data(
        mobileOtpStatus: mobileOtpStatus ?? this.mobileOtpStatus,
        mobileOtpSentAt: mobileOtpSentAt ?? this.mobileOtpSentAt,
        mobileOtpHits: mobileOtpHits ?? this.mobileOtpHits,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
