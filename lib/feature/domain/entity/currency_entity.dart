import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.g.dart';
part 'currency_entity.freezed.dart';

/// CurrencyEntity class is a data class that holds the data of the currency conversion.

@freezed
class CurrencyEntity with _$CurrencyEntity {
  const factory CurrencyEntity({
    required String result,
    required String baseCode,
    required String targetCode,
    required double conversionRate,
    required double conversionResult,
  }) = _CurrencyEntity;

  factory CurrencyEntity.fromJson(Map<String, Object?> json) => _$CurrencyEntityFromJson(json);
}
