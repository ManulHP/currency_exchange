part of 'currency_bloc.dart';

enum CurrencyStatus { initial, loading, success, failure }

class CurrencyState extends Equatable {
  final String? errorMessage;
  final CurrencyStatus status;
  final CurrencyEntity? currencyEntity;

  const CurrencyState({
    this.errorMessage,
    this.status = CurrencyStatus.initial,
    this.currencyEntity,
  });

  @override
  List<Object?> get props => [errorMessage, status, currencyEntity];

  CurrencyState copyWith({
    String? errorMessage,
    CurrencyStatus? status,
    CurrencyEntity? currencyEntity,
  }) {
    return CurrencyState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      currencyEntity: currencyEntity ?? this.currencyEntity,
    );
  }

}