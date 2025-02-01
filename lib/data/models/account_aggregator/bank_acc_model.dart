// To parse this JSON data, do
//
//     final bankAccModel = bankAccModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'bank_acc_model.g.dart';

BankAccModel bankAccModelFromJson(String str) =>
    BankAccModel.fromJson(json.decode(str));

String bankAccModelToJson(BankAccModel data) => json.encode(data.toJson());

@JsonSerializable()
class BankAccModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  BankAccModel({
    this.success,
    this.message,
    this.data,
  });

  BankAccModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      BankAccModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BankAccModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "bank_accounts")
  final List<BankAccount>? bankAccounts;

  Data({
    this.bankAccounts,
  });

  Data copyWith({
    List<BankAccount>? bankAccounts,
  }) =>
      Data(
        bankAccounts: bankAccounts ?? this.bankAccounts,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class BankAccount {
  @JsonKey(name: "bankName")
  final String? bankName;
  @JsonKey(name: "FIstatus")
  final String? fIstatus;
  @JsonKey(name: "balanceDateTime")
  final DateTime? balanceDateTime;
  @JsonKey(name: "branch")
  final String? branch;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "currentBalance")
  final String? currentBalance;
  @JsonKey(name: "currentODLimit")
  final String? currentOdLimit;
  @JsonKey(name: "drawingLimit")
  final String? drawingLimit;
  @JsonKey(name: "exchgeRate")
  final String? exchgeRate;
  @JsonKey(name: "ifscCode")
  final String? ifscCode;
  @JsonKey(name: "micrCode")
  final String? micrCode;
  @JsonKey(name: "openingDate")
  final DateTime? openingDate;
  @JsonKey(name: "pending")
  final Pending? pending;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "maskedAccNumber")
  final String? maskedAccNumber;
  @JsonKey(name: "error")
  final String? error;

  BankAccount({
    this.bankName,
    this.fIstatus,
    this.balanceDateTime,
    this.branch,
    this.currency,
    this.currentBalance,
    this.currentOdLimit,
    this.drawingLimit,
    this.exchgeRate,
    this.ifscCode,
    this.micrCode,
    this.openingDate,
    this.pending,
    this.status,
    this.type,
    this.maskedAccNumber,
    this.error,
  });

  BankAccount copyWith({
    String? bankName,
    String? fIstatus,
    DateTime? balanceDateTime,
    String? branch,
    String? currency,
    String? currentBalance,
    String? currentOdLimit,
    String? drawingLimit,
    String? exchgeRate,
    String? ifscCode,
    String? micrCode,
    DateTime? openingDate,
    Pending? pending,
    String? status,
    String? type,
    String? maskedAccNumber,
    String? error,
  }) =>
      BankAccount(
        bankName: bankName ?? this.bankName,
        fIstatus: fIstatus ?? this.fIstatus,
        balanceDateTime: balanceDateTime ?? this.balanceDateTime,
        branch: branch ?? this.branch,
        currency: currency ?? this.currency,
        currentBalance: currentBalance ?? this.currentBalance,
        currentOdLimit: currentOdLimit ?? this.currentOdLimit,
        drawingLimit: drawingLimit ?? this.drawingLimit,
        exchgeRate: exchgeRate ?? this.exchgeRate,
        ifscCode: ifscCode ?? this.ifscCode,
        micrCode: micrCode ?? this.micrCode,
        openingDate: openingDate ?? this.openingDate,
        pending: pending ?? this.pending,
        status: status ?? this.status,
        type: type ?? this.type,
        maskedAccNumber: maskedAccNumber ?? this.maskedAccNumber,
        error: error ?? this.error,
      );

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}

@JsonSerializable()
class Pending {
  @JsonKey(name: "amount")
  final String? amount;

  Pending({
    this.amount,
  });

  Pending copyWith({
    String? amount,
  }) =>
      Pending(
        amount: amount ?? this.amount,
      );

  factory Pending.fromJson(Map<String, dynamic> json) =>
      _$PendingFromJson(json);

  Map<String, dynamic> toJson() => _$PendingToJson(this);
}
