// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ProfileModel({
    this.success,
    this.message,
    this.data,
  });

  ProfileModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ProfileModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "client_id")
  final String? clientId;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "mobile_number")
  final String? mobileNumber;
  @JsonKey(name: "pan_number")
  final String? panNumber;
  @JsonKey(name: "dob")
  final dynamic dob;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.clientId,
    this.email,
    this.mobileNumber,
    this.panNumber,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? name,
    String? clientId,
    String? email,
    String? mobileNumber,
    String? panNumber,
    dynamic dob,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        clientId: clientId ?? this.clientId,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        panNumber: panNumber ?? this.panNumber,
        dob: dob ?? this.dob,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
