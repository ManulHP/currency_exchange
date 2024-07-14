// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entity/currency_entity.dart';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel extends Equatable {
  final String? result;
  final String? documentation;
  final String? termsOfUse;
  final int? timeLastUpdateUnix;
  final String? timeLastUpdateUtc;
  final int? timeNextUpdateUnix;
  final String? timeNextUpdateUtc;
  final String? baseCode;
  final String? targetCode;
  final double? conversionRate;
  final double? conversionResult;

  const CurrencyModel({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.targetCode,
    this.conversionRate,
    this.conversionResult,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        timeLastUpdateUnix: json["time_last_update_unix"],
        timeLastUpdateUtc: json["time_last_update_utc"],
        timeNextUpdateUnix: json["time_next_update_unix"],
        timeNextUpdateUtc: json["time_next_update_utc"],
        baseCode: json["base_code"],
        targetCode: json["target_code"],
        conversionRate: json["conversion_rate"]?.toDouble(),
        conversionResult: json["conversion_result"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "time_last_update_unix": timeLastUpdateUnix,
        "time_last_update_utc": timeLastUpdateUtc,
        "time_next_update_unix": timeNextUpdateUnix,
        "time_next_update_utc": timeNextUpdateUtc,
        "base_code": baseCode,
        "target_code": targetCode,
        "conversion_rate": conversionRate,
        "conversion_result": conversionResult,
      };

  CurrencyEntity toEntity() {
    return CurrencyEntity(
      result: result ?? '',
      baseCode: baseCode ?? '',
      targetCode: targetCode ?? '',
      conversionRate: conversionRate ?? 0.0,
      conversionResult: conversionResult ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [
        result,
        documentation,
        termsOfUse,
        timeLastUpdateUnix,
        timeLastUpdateUtc,
        timeNextUpdateUnix,
        timeNextUpdateUtc,
        baseCode,
        targetCode,
        conversionRate,
        conversionResult,
      ];
}
