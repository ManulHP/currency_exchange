import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'currency_entity.g.dart';

@CopyWith()
class CurrencyEntity extends Equatable {
  final String result;
  final String baseCode;
  final String targetCode;
  final double conversionRate;
  final double conversionResult;


  const CurrencyEntity({
    required this.result,
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
    required this.conversionResult,
  });

  @override
  List<Object?> get props => [result, baseCode, targetCode, conversionRate, conversionResult];
}