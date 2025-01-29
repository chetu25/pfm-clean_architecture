// To parse this JSON data, do
//
//     final setuConsentUrlModel = setuConsentUrlModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'setu_consent_url_model.g.dart';

SetuConsentUrlModel setuConsentUrlModelFromJson(String str) =>
    SetuConsentUrlModel.fromJson(json.decode(str));

String setuConsentUrlModelToJson(SetuConsentUrlModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SetuConsentUrlModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  SetuConsentUrlModel({
    this.success,
    this.message,
    this.data,
  });

  SetuConsentUrlModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      SetuConsentUrlModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SetuConsentUrlModel.fromJson(Map<String, dynamic> json) =>
      _$SetuConsentUrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetuConsentUrlModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "redirect_url")
  final String? redirectUrl;

  Data({
    this.redirectUrl,
  });

  Data copyWith({
    String? redirectUrl,
  }) =>
      Data(
        redirectUrl: redirectUrl ?? this.redirectUrl,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
