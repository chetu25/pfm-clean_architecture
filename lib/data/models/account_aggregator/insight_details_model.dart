// To parse this JSON data, do
//
//     final insightDetailsModel = insightDetailsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'insight_details_model.g.dart';

InsightDetailsModel insightDetailsModelFromJson(String str) =>
    InsightDetailsModel.fromJson(json.decode(str));

String insightDetailsModelToJson(InsightDetailsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class InsightDetailsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final InsightDetailsModelData? data;

  InsightDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  InsightDetailsModel copyWith({
    bool? success,
    String? message,
    InsightDetailsModelData? data,
  }) =>
      InsightDetailsModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory InsightDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$InsightDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsightDetailsModelToJson(this);
}

@JsonSerializable()
class InsightDetailsModelData {
  @JsonKey(name: "spending_categories")
  final SpendingCategories? spendingCategories;
  @JsonKey(name: "incomes_and_expenses")
  final List<IncomesAndExpense>? incomesAndExpenses;
  @JsonKey(name: "top_transactions")
  final List<TopTransaction>? topTransactions;

  InsightDetailsModelData({
    this.spendingCategories,
    this.incomesAndExpenses,
    this.topTransactions,
  });

  InsightDetailsModelData copyWith({
    SpendingCategories? spendingCategories,
    List<IncomesAndExpense>? incomesAndExpenses,
    List<TopTransaction>? topTransactions,
  }) =>
      InsightDetailsModelData(
        spendingCategories: spendingCategories ?? this.spendingCategories,
        incomesAndExpenses: incomesAndExpenses ?? this.incomesAndExpenses,
        topTransactions: topTransactions ?? this.topTransactions,
      );

  factory InsightDetailsModelData.fromJson(Map<String, dynamic> json) =>
      _$InsightDetailsModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$InsightDetailsModelDataToJson(this);
}

@JsonSerializable()
class IncomesAndExpense {
  @JsonKey(name: "year")
  final int? year;
  @JsonKey(name: "month")
  final int? month;
  @JsonKey(name: "income")
  final double? income;
  @JsonKey(name: "expense")
  final double? expense;

  IncomesAndExpense({
    this.year,
    this.month,
    this.income,
    this.expense,
  });

  IncomesAndExpense copyWith({
    int? year,
    int? month,
    double? income,
    double? expense,
  }) =>
      IncomesAndExpense(
        year: year ?? this.year,
        month: month ?? this.month,
        income: income ?? this.income,
        expense: expense ?? this.expense,
      );

  factory IncomesAndExpense.fromJson(Map<String, dynamic> json) =>
      _$IncomesAndExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$IncomesAndExpenseToJson(this);
}

@JsonSerializable()
class SpendingCategories {
  @JsonKey(name: "data")
  final SpendingCategoriesData? data;
  @JsonKey(name: "total")
  final double? total;

  SpendingCategories({
    this.data,
    this.total,
  });

  SpendingCategories copyWith({
    SpendingCategoriesData? data,
    double? total,
  }) =>
      SpendingCategories(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory SpendingCategories.fromJson(Map<String, dynamic> json) =>
      _$SpendingCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$SpendingCategoriesToJson(this);
}

@JsonSerializable()
class SpendingCategoriesData {
  @JsonKey(name: "Bank Charges")
  final BankCharges? bankCharges;
  @JsonKey(name: "Cash Withdrawal")
  final CashWithdrawal? cashWithdrawal;
  @JsonKey(name: "Entertainment")
  final Entertainment? entertainment;
  @JsonKey(name: "Food & Drinks")
  final FoodDrinks? foodDrinks;
  @JsonKey(name: "Groceries")
  final Groceries? groceries;
  @JsonKey(name: "Health")
  final Health? health;
  @JsonKey(name: "Investments")
  final Investments? investments;
  @JsonKey(name: "Loan")
  final Loan? loan;
  @JsonKey(name: "Others")
  final FoodDrinks? others;
  @JsonKey(name: "Professional Services")
  final Groceries? professionalServices;
  @JsonKey(name: "Shopping")
  final Shopping? shopping;
  @JsonKey(name: "Transfer")
  final FoodDrinks? transfer;
  @JsonKey(name: "Travel and Transport")
  final BankCharges? travelAndTransport;
  @JsonKey(name: "Utility Payments")
  final FoodDrinks? utilityPayments;
  @JsonKey(name: "Vehicle")
  final Vehicle? vehicle;

  SpendingCategoriesData({
    this.bankCharges,
    this.cashWithdrawal,
    this.entertainment,
    this.foodDrinks,
    this.groceries,
    this.health,
    this.investments,
    this.loan,
    this.others,
    this.professionalServices,
    this.shopping,
    this.transfer,
    this.travelAndTransport,
    this.utilityPayments,
    this.vehicle,
  });

  SpendingCategoriesData copyWith({
    BankCharges? bankCharges,
    CashWithdrawal? cashWithdrawal,
    Entertainment? entertainment,
    FoodDrinks? foodDrinks,
    Groceries? groceries,
    Health? health,
    Investments? investments,
    Loan? loan,
    FoodDrinks? others,
    Groceries? professionalServices,
    Shopping? shopping,
    FoodDrinks? transfer,
    BankCharges? travelAndTransport,
    FoodDrinks? utilityPayments,
    Vehicle? vehicle,
  }) =>
      SpendingCategoriesData(
        bankCharges: bankCharges ?? this.bankCharges,
        cashWithdrawal: cashWithdrawal ?? this.cashWithdrawal,
        entertainment: entertainment ?? this.entertainment,
        foodDrinks: foodDrinks ?? this.foodDrinks,
        groceries: groceries ?? this.groceries,
        health: health ?? this.health,
        investments: investments ?? this.investments,
        loan: loan ?? this.loan,
        others: others ?? this.others,
        professionalServices: professionalServices ?? this.professionalServices,
        shopping: shopping ?? this.shopping,
        transfer: transfer ?? this.transfer,
        travelAndTransport: travelAndTransport ?? this.travelAndTransport,
        utilityPayments: utilityPayments ?? this.utilityPayments,
        vehicle: vehicle ?? this.vehicle,
      );

  factory SpendingCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$SpendingCategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpendingCategoriesDataToJson(this);
}

@JsonSerializable()
class BankCharges {
  @JsonKey(name: "data")
  final BankChargesData? data;
  @JsonKey(name: "total")
  final double? total;

  BankCharges({
    this.data,
    this.total,
  });

  BankCharges copyWith({
    BankChargesData? data,
    double? total,
  }) =>
      BankCharges(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory BankCharges.fromJson(Map<String, dynamic> json) =>
      _$BankChargesFromJson(json);

  Map<String, dynamic> toJson() => _$BankChargesToJson(this);
}

@JsonSerializable()
class BankChargesData {
  @JsonKey(name: "2024")
  final Purple2024? the2024;

  BankChargesData({
    this.the2024,
  });

  BankChargesData copyWith({
    Purple2024? the2024,
  }) =>
      BankChargesData(
        the2024: the2024 ?? this.the2024,
      );

  factory BankChargesData.fromJson(Map<String, dynamic> json) =>
      _$BankChargesDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankChargesDataToJson(this);
}

@JsonSerializable()
class Purple2024 {
  @JsonKey(name: "5")
  final double? the5;
  @JsonKey(name: "6")
  final double? the6;
  @JsonKey(name: "7")
  final double? the7;
  @JsonKey(name: "9")
  final double? the9;
  @JsonKey(name: "10")
  final double? the10;
  @JsonKey(name: "12")
  final double? the12;
  @JsonKey(name: "8")
  final double? the8;
  @JsonKey(name: "11")
  final int? the11;

  Purple2024({
    this.the5,
    this.the6,
    this.the7,
    this.the9,
    this.the10,
    this.the12,
    this.the8,
    this.the11,
  });

  Purple2024 copyWith({
    double? the5,
    double? the6,
    double? the7,
    double? the9,
    double? the10,
    double? the12,
    double? the8,
    int? the11,
  }) =>
      Purple2024(
        the5: the5 ?? this.the5,
        the6: the6 ?? this.the6,
        the7: the7 ?? this.the7,
        the9: the9 ?? this.the9,
        the10: the10 ?? this.the10,
        the12: the12 ?? this.the12,
        the8: the8 ?? this.the8,
        the11: the11 ?? this.the11,
      );

  factory Purple2024.fromJson(Map<String, dynamic> json) =>
      _$Purple2024FromJson(json);

  Map<String, dynamic> toJson() => _$Purple2024ToJson(this);
}

@JsonSerializable()
class CashWithdrawal {
  @JsonKey(name: "data")
  final CashWithdrawalData? data;
  @JsonKey(name: "total")
  final int? total;

  CashWithdrawal({
    this.data,
    this.total,
  });

  CashWithdrawal copyWith({
    CashWithdrawalData? data,
    int? total,
  }) =>
      CashWithdrawal(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory CashWithdrawal.fromJson(Map<String, dynamic> json) =>
      _$CashWithdrawalFromJson(json);

  Map<String, dynamic> toJson() => _$CashWithdrawalToJson(this);
}

@JsonSerializable()
class CashWithdrawalData {
  @JsonKey(name: "2024")
  final Fluffy2024? the2024;
  @JsonKey(name: "2025")
  final The2025? the2025;

  CashWithdrawalData({
    this.the2024,
    this.the2025,
  });

  CashWithdrawalData copyWith({
    Fluffy2024? the2024,
    The2025? the2025,
  }) =>
      CashWithdrawalData(
        the2024: the2024 ?? this.the2024,
        the2025: the2025 ?? this.the2025,
      );

  factory CashWithdrawalData.fromJson(Map<String, dynamic> json) =>
      _$CashWithdrawalDataFromJson(json);

  Map<String, dynamic> toJson() => _$CashWithdrawalDataToJson(this);
}

@JsonSerializable()
class Fluffy2024 {
  @JsonKey(name: "5")
  final int? the5;
  @JsonKey(name: "8")
  final int? the8;

  Fluffy2024({
    this.the5,
    this.the8,
  });

  Fluffy2024 copyWith({
    int? the5,
    int? the8,
  }) =>
      Fluffy2024(
        the5: the5 ?? this.the5,
        the8: the8 ?? this.the8,
      );

  factory Fluffy2024.fromJson(Map<String, dynamic> json) =>
      _$Fluffy2024FromJson(json);

  Map<String, dynamic> toJson() => _$Fluffy2024ToJson(this);
}

@JsonSerializable()
class The2025 {
  @JsonKey(name: "1")
  final double? the1;

  The2025({
    this.the1,
  });

  The2025 copyWith({
    double? the1,
  }) =>
      The2025(
        the1: the1 ?? this.the1,
      );

  factory The2025.fromJson(Map<String, dynamic> json) =>
      _$The2025FromJson(json);

  Map<String, dynamic> toJson() => _$The2025ToJson(this);
}

@JsonSerializable()
class Entertainment {
  @JsonKey(name: "data")
  final EntertainmentData? data;
  @JsonKey(name: "total")
  final double? total;

  Entertainment({
    this.data,
    this.total,
  });

  Entertainment copyWith({
    EntertainmentData? data,
    double? total,
  }) =>
      Entertainment(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Entertainment.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentFromJson(json);

  Map<String, dynamic> toJson() => _$EntertainmentToJson(this);
}

@JsonSerializable()
class EntertainmentData {
  @JsonKey(name: "2024")
  final Tentacled2024? the2024;

  EntertainmentData({
    this.the2024,
  });

  EntertainmentData copyWith({
    Tentacled2024? the2024,
  }) =>
      EntertainmentData(
        the2024: the2024 ?? this.the2024,
      );

  factory EntertainmentData.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$EntertainmentDataToJson(this);
}

@JsonSerializable()
class Tentacled2024 {
  @JsonKey(name: "7")
  final double? the7;
  @JsonKey(name: "11")
  final double? the11;

  Tentacled2024({
    this.the7,
    this.the11,
  });

  Tentacled2024 copyWith({
    double? the7,
    double? the11,
  }) =>
      Tentacled2024(
        the7: the7 ?? this.the7,
        the11: the11 ?? this.the11,
      );

  factory Tentacled2024.fromJson(Map<String, dynamic> json) =>
      _$Tentacled2024FromJson(json);

  Map<String, dynamic> toJson() => _$Tentacled2024ToJson(this);
}

@JsonSerializable()
class FoodDrinks {
  @JsonKey(name: "data")
  final FoodDrinksData? data;
  @JsonKey(name: "total")
  final double? total;

  FoodDrinks({
    this.data,
    this.total,
  });

  FoodDrinks copyWith({
    FoodDrinksData? data,
    double? total,
  }) =>
      FoodDrinks(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory FoodDrinks.fromJson(Map<String, dynamic> json) =>
      _$FoodDrinksFromJson(json);

  Map<String, dynamic> toJson() => _$FoodDrinksToJson(this);
}

@JsonSerializable()
class FoodDrinksData {
  @JsonKey(name: "2024")
  final Purple2024? the2024;
  @JsonKey(name: "2025")
  final The2025? the2025;

  FoodDrinksData({
    this.the2024,
    this.the2025,
  });

  FoodDrinksData copyWith({
    Purple2024? the2024,
    The2025? the2025,
  }) =>
      FoodDrinksData(
        the2024: the2024 ?? this.the2024,
        the2025: the2025 ?? this.the2025,
      );

  factory FoodDrinksData.fromJson(Map<String, dynamic> json) =>
      _$FoodDrinksDataFromJson(json);

  Map<String, dynamic> toJson() => _$FoodDrinksDataToJson(this);
}

@JsonSerializable()
class Groceries {
  @JsonKey(name: "total")
  final int? total;

  Groceries({
    this.total,
  });

  Groceries copyWith({
    int? total,
  }) =>
      Groceries(
        total: total ?? this.total,
      );

  factory Groceries.fromJson(Map<String, dynamic> json) =>
      _$GroceriesFromJson(json);

  Map<String, dynamic> toJson() => _$GroceriesToJson(this);
}

@JsonSerializable()
class Health {
  @JsonKey(name: "data")
  final HealthData? data;
  @JsonKey(name: "total")
  final int? total;

  Health({
    this.data,
    this.total,
  });

  Health copyWith({
    HealthData? data,
    int? total,
  }) =>
      Health(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Health.fromJson(Map<String, dynamic> json) => _$HealthFromJson(json);

  Map<String, dynamic> toJson() => _$HealthToJson(this);
}

@JsonSerializable()
class HealthData {
  @JsonKey(name: "2024")
  final Sticky2024? the2024;

  HealthData({
    this.the2024,
  });

  HealthData copyWith({
    Sticky2024? the2024,
  }) =>
      HealthData(
        the2024: the2024 ?? this.the2024,
      );

  factory HealthData.fromJson(Map<String, dynamic> json) =>
      _$HealthDataFromJson(json);

  Map<String, dynamic> toJson() => _$HealthDataToJson(this);
}

@JsonSerializable()
class Sticky2024 {
  @JsonKey(name: "5")
  final int? the5;
  @JsonKey(name: "9")
  final int? the9;

  Sticky2024({
    this.the5,
    this.the9,
  });

  Sticky2024 copyWith({
    int? the5,
    int? the9,
  }) =>
      Sticky2024(
        the5: the5 ?? this.the5,
        the9: the9 ?? this.the9,
      );

  factory Sticky2024.fromJson(Map<String, dynamic> json) =>
      _$Sticky2024FromJson(json);

  Map<String, dynamic> toJson() => _$Sticky2024ToJson(this);
}

@JsonSerializable()
class Investments {
  @JsonKey(name: "data")
  final InvestmentsData? data;
  @JsonKey(name: "total")
  final int? total;

  Investments({
    this.data,
    this.total,
  });

  Investments copyWith({
    InvestmentsData? data,
    int? total,
  }) =>
      Investments(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Investments.fromJson(Map<String, dynamic> json) =>
      _$InvestmentsFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentsToJson(this);
}

@JsonSerializable()
class InvestmentsData {
  @JsonKey(name: "2024")
  final Indigo2024? the2024;

  InvestmentsData({
    this.the2024,
  });

  InvestmentsData copyWith({
    Indigo2024? the2024,
  }) =>
      InvestmentsData(
        the2024: the2024 ?? this.the2024,
      );

  factory InvestmentsData.fromJson(Map<String, dynamic> json) =>
      _$InvestmentsDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentsDataToJson(this);
}

@JsonSerializable()
class Indigo2024 {
  @JsonKey(name: "6")
  final int? the6;
  @JsonKey(name: "9")
  final int? the9;

  Indigo2024({
    this.the6,
    this.the9,
  });

  Indigo2024 copyWith({
    int? the6,
    int? the9,
  }) =>
      Indigo2024(
        the6: the6 ?? this.the6,
        the9: the9 ?? this.the9,
      );

  factory Indigo2024.fromJson(Map<String, dynamic> json) =>
      _$Indigo2024FromJson(json);

  Map<String, dynamic> toJson() => _$Indigo2024ToJson(this);
}

@JsonSerializable()
class Loan {
  @JsonKey(name: "data")
  final LoanData? data;
  @JsonKey(name: "total")
  final int? total;

  Loan({
    this.data,
    this.total,
  });

  Loan copyWith({
    LoanData? data,
    int? total,
  }) =>
      Loan(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);

  Map<String, dynamic> toJson() => _$LoanToJson(this);
}

@JsonSerializable()
class LoanData {
  @JsonKey(name: "2024")
  final Indecent2024? the2024;

  LoanData({
    this.the2024,
  });

  LoanData copyWith({
    Indecent2024? the2024,
  }) =>
      LoanData(
        the2024: the2024 ?? this.the2024,
      );

  factory LoanData.fromJson(Map<String, dynamic> json) =>
      _$LoanDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoanDataToJson(this);
}

@JsonSerializable()
class Indecent2024 {
  @JsonKey(name: "7")
  final int? the7;

  Indecent2024({
    this.the7,
  });

  Indecent2024 copyWith({
    int? the7,
  }) =>
      Indecent2024(
        the7: the7 ?? this.the7,
      );

  factory Indecent2024.fromJson(Map<String, dynamic> json) =>
      _$Indecent2024FromJson(json);

  Map<String, dynamic> toJson() => _$Indecent2024ToJson(this);
}

@JsonSerializable()
class Shopping {
  @JsonKey(name: "data")
  final ShoppingData? data;
  @JsonKey(name: "total")
  final int? total;

  Shopping({
    this.data,
    this.total,
  });

  Shopping copyWith({
    ShoppingData? data,
    int? total,
  }) =>
      Shopping(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Shopping.fromJson(Map<String, dynamic> json) =>
      _$ShoppingFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingToJson(this);
}

@JsonSerializable()
class ShoppingData {
  @JsonKey(name: "2024")
  final Hilarious2024? the2024;
  @JsonKey(name: "2025")
  final The2025? the2025;

  ShoppingData({
    this.the2024,
    this.the2025,
  });

  ShoppingData copyWith({
    Hilarious2024? the2024,
    The2025? the2025,
  }) =>
      ShoppingData(
        the2024: the2024 ?? this.the2024,
        the2025: the2025 ?? this.the2025,
      );

  factory ShoppingData.fromJson(Map<String, dynamic> json) =>
      _$ShoppingDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingDataToJson(this);
}

@JsonSerializable()
class Hilarious2024 {
  @JsonKey(name: "5")
  final int? the5;
  @JsonKey(name: "7")
  final int? the7;
  @JsonKey(name: "8")
  final int? the8;
  @JsonKey(name: "9")
  final int? the9;
  @JsonKey(name: "10")
  final int? the10;

  Hilarious2024({
    this.the5,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
  });

  Hilarious2024 copyWith({
    int? the5,
    int? the7,
    int? the8,
    int? the9,
    int? the10,
  }) =>
      Hilarious2024(
        the5: the5 ?? this.the5,
        the7: the7 ?? this.the7,
        the8: the8 ?? this.the8,
        the9: the9 ?? this.the9,
        the10: the10 ?? this.the10,
      );

  factory Hilarious2024.fromJson(Map<String, dynamic> json) =>
      _$Hilarious2024FromJson(json);

  Map<String, dynamic> toJson() => _$Hilarious2024ToJson(this);
}

@JsonSerializable()
class Vehicle {
  @JsonKey(name: "data")
  final VehicleData? data;
  @JsonKey(name: "total")
  final int? total;

  Vehicle({
    this.data,
    this.total,
  });

  Vehicle copyWith({
    VehicleData? data,
    int? total,
  }) =>
      Vehicle(
        data: data ?? this.data,
        total: total ?? this.total,
      );

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

@JsonSerializable()
class VehicleData {
  @JsonKey(name: "2024")
  final Ambitious2024? the2024;

  VehicleData({
    this.the2024,
  });

  VehicleData copyWith({
    Ambitious2024? the2024,
  }) =>
      VehicleData(
        the2024: the2024 ?? this.the2024,
      );

  factory VehicleData.fromJson(Map<String, dynamic> json) =>
      _$VehicleDataFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDataToJson(this);
}

@JsonSerializable()
class Ambitious2024 {
  @JsonKey(name: "7")
  final int? the7;
  @JsonKey(name: "8")
  final int? the8;
  @JsonKey(name: "9")
  final int? the9;
  @JsonKey(name: "11")
  final int? the11;
  @JsonKey(name: "12")
  final int? the12;

  Ambitious2024({
    this.the7,
    this.the8,
    this.the9,
    this.the11,
    this.the12,
  });

  Ambitious2024 copyWith({
    int? the7,
    int? the8,
    int? the9,
    int? the11,
    int? the12,
  }) =>
      Ambitious2024(
        the7: the7 ?? this.the7,
        the8: the8 ?? this.the8,
        the9: the9 ?? this.the9,
        the11: the11 ?? this.the11,
        the12: the12 ?? this.the12,
      );

  factory Ambitious2024.fromJson(Map<String, dynamic> json) =>
      _$Ambitious2024FromJson(json);

  Map<String, dynamic> toJson() => _$Ambitious2024ToJson(this);
}

@JsonSerializable()
class TopTransaction {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "mode")
  final String? mode;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "currentBalance")
  final String? currentBalance;
  @JsonKey(name: "transactionTimestamp")
  final DateTime? transactionTimestamp;
  @JsonKey(name: "valueDate")
  final DateTime? valueDate;
  @JsonKey(name: "txnId")
  final String? txnId;
  @JsonKey(name: "narration")
  final String? narration;
  @JsonKey(name: "reference")
  final String? reference;
  @JsonKey(name: "l1Category")
  final String? l1Category;
  @JsonKey(name: "l2Category")
  final String? l2Category;
  @JsonKey(name: "receiver_sender_name")
  final String? receiverSenderName;
  @JsonKey(name: "upi_id")
  final String? upiId;

  TopTransaction({
    this.type,
    this.mode,
    this.amount,
    this.currentBalance,
    this.transactionTimestamp,
    this.valueDate,
    this.txnId,
    this.narration,
    this.reference,
    this.l1Category,
    this.l2Category,
    this.receiverSenderName,
    this.upiId,
  });

  TopTransaction copyWith({
    String? type,
    String? mode,
    int? amount,
    String? currentBalance,
    DateTime? transactionTimestamp,
    DateTime? valueDate,
    String? txnId,
    String? narration,
    String? reference,
    String? l1Category,
    String? l2Category,
    String? receiverSenderName,
    String? upiId,
  }) =>
      TopTransaction(
        type: type ?? this.type,
        mode: mode ?? this.mode,
        amount: amount ?? this.amount,
        currentBalance: currentBalance ?? this.currentBalance,
        transactionTimestamp: transactionTimestamp ?? this.transactionTimestamp,
        valueDate: valueDate ?? this.valueDate,
        txnId: txnId ?? this.txnId,
        narration: narration ?? this.narration,
        reference: reference ?? this.reference,
        l1Category: l1Category ?? this.l1Category,
        l2Category: l2Category ?? this.l2Category,
        receiverSenderName: receiverSenderName ?? this.receiverSenderName,
        upiId: upiId ?? this.upiId,
      );

  factory TopTransaction.fromJson(Map<String, dynamic> json) =>
      _$TopTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TopTransactionToJson(this);
}
