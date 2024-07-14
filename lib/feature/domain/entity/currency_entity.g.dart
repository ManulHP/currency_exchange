// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CurrencyEntityCWProxy {
  CurrencyEntity result(String result);

  CurrencyEntity baseCode(String baseCode);

  CurrencyEntity targetCode(String targetCode);

  CurrencyEntity conversionRate(double conversionRate);

  CurrencyEntity conversionResult(double conversionResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrencyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrencyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrencyEntity call({
    String? result,
    String? baseCode,
    String? targetCode,
    double? conversionRate,
    double? conversionResult,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCurrencyEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCurrencyEntity.copyWith.fieldName(...)`
class _$CurrencyEntityCWProxyImpl implements _$CurrencyEntityCWProxy {
  const _$CurrencyEntityCWProxyImpl(this._value);

  final CurrencyEntity _value;

  @override
  CurrencyEntity result(String result) => this(result: result);

  @override
  CurrencyEntity baseCode(String baseCode) => this(baseCode: baseCode);

  @override
  CurrencyEntity targetCode(String targetCode) => this(targetCode: targetCode);

  @override
  CurrencyEntity conversionRate(double conversionRate) =>
      this(conversionRate: conversionRate);

  @override
  CurrencyEntity conversionResult(double conversionResult) =>
      this(conversionResult: conversionResult);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrencyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrencyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrencyEntity call({
    Object? result = const $CopyWithPlaceholder(),
    Object? baseCode = const $CopyWithPlaceholder(),
    Object? targetCode = const $CopyWithPlaceholder(),
    Object? conversionRate = const $CopyWithPlaceholder(),
    Object? conversionResult = const $CopyWithPlaceholder(),
  }) {
    return CurrencyEntity(
      result: result == const $CopyWithPlaceholder() || result == null
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as String,
      baseCode: baseCode == const $CopyWithPlaceholder() || baseCode == null
          ? _value.baseCode
          // ignore: cast_nullable_to_non_nullable
          : baseCode as String,
      targetCode:
          targetCode == const $CopyWithPlaceholder() || targetCode == null
              ? _value.targetCode
              // ignore: cast_nullable_to_non_nullable
              : targetCode as String,
      conversionRate: conversionRate == const $CopyWithPlaceholder() ||
              conversionRate == null
          ? _value.conversionRate
          // ignore: cast_nullable_to_non_nullable
          : conversionRate as double,
      conversionResult: conversionResult == const $CopyWithPlaceholder() ||
              conversionResult == null
          ? _value.conversionResult
          // ignore: cast_nullable_to_non_nullable
          : conversionResult as double,
    );
  }
}

extension $CurrencyEntityCopyWith on CurrencyEntity {
  /// Returns a callable class that can be used as follows: `instanceOfCurrencyEntity.copyWith(...)` or like so:`instanceOfCurrencyEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CurrencyEntityCWProxy get copyWith => _$CurrencyEntityCWProxyImpl(this);
}
