// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyEntityImpl _$$CurrencyEntityImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyEntityImpl(
      result: json['result'] as String,
      baseCode: json['baseCode'] as String,
      targetCode: json['targetCode'] as String,
      conversionRate: (json['conversionRate'] as num).toDouble(),
      conversionResult: (json['conversionResult'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrencyEntityImplToJson(
        _$CurrencyEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'baseCode': instance.baseCode,
      'targetCode': instance.targetCode,
      'conversionRate': instance.conversionRate,
      'conversionResult': instance.conversionResult,
    };
