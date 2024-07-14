part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class GetExchangeRate extends CurrencyEvent {
  final String baseCode;
  final String targetCode;
  final double amount;

  const GetExchangeRate({ required this.baseCode, required this.targetCode, required this.amount });

  @override
  List<Object> get props => [baseCode, targetCode, amount];
}
