part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class GetAmount extends CurrencyEvent {
  final String amount;

  const GetAmount({ required this.amount });

  @override
  List<Object> get props => [amount];
}

class GetBaseCountry extends CurrencyEvent {
  final String baseCode;

  const GetBaseCountry({ required this.baseCode });

  @override
  List<Object> get props => [baseCode];
}

class GetTargetCountry extends CurrencyEvent {
  final String targetCode;

  const GetTargetCountry({ required this.targetCode });

  @override
  List<Object> get props => [targetCode];
}


class GetExchangeRate extends CurrencyEvent {

  const GetExchangeRate();

  @override
  List<Object> get props => [];
}
