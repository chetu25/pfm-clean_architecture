// To parse this JSON data, do
//
//     final phoneOtpParams = phoneOtpParamsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'phone_otp_params.g.dart';

PhoneOtpParams phoneOtpParamsFromJson(String str) =>
    PhoneOtpParams.fromJson(json.decode(str));

String phoneOtpParamsToJson(PhoneOtpParams data) => json.encode(data.toJson());

@JsonSerializable()
class PhoneOtpParams {
  @JsonKey(name: "mobile_number")
  final String mobileNumber;
  @JsonKey(name: "mobile_otp")
  final String mobileOtp;

  PhoneOtpParams({
    required this.mobileNumber,
    required this.mobileOtp,
  });

  PhoneOtpParams copyWith({
    String? mobileNumber,
    String? mobileOtp,
  }) =>
      PhoneOtpParams(
        mobileNumber: mobileNumber ?? this.mobileNumber,
        mobileOtp: mobileOtp ?? this.mobileOtp,
      );

  factory PhoneOtpParams.fromJson(Map<String, dynamic> json) =>
      _$PhoneOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneOtpParamsToJson(this);
}
