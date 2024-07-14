part of 'currency_bloc.dart';

enum CurrencyStatus { initial, loading, success, failure }

class CurrencyState extends Equatable {
  final String? errorMessage;
  final CurrencyStatus status;
  final CurrencyEntity? currencyEntity;
  final String amount;
  final String baseCode;
  final String targetCode;

  const CurrencyState({
    this.errorMessage,
    this.status = CurrencyStatus.initial,
    this.currencyEntity,
    this.amount = "",
    this.baseCode = "LKR",
    this.targetCode = "USD",
  });

  @override
  List<Object?> get props => [errorMessage, status, currencyEntity, amount, baseCode, targetCode];

  CurrencyState copyWith({
    String? errorMessage,
    CurrencyStatus? status,
    CurrencyEntity? currencyEntity,
    String? amount,
    String? baseCode,
    String? targetCode,
  }) {
    return CurrencyState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      currencyEntity: currencyEntity ?? this.currencyEntity,
      amount: amount ?? this.amount,
      baseCode: baseCode ?? this.baseCode,
      targetCode: targetCode ?? this.targetCode,
    );
  }
}
