import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entity/currency_entity.dart';
import '../repository/currency_repository.dart';

/// Business logic for the currency conversion.

class CurrencyUsecase implements UseCase<CurrencyEntity, CurrencyParams> {
  final CurrencyRepository currencyRepository;

  CurrencyUsecase({required this.currencyRepository});

  @override
  Future<Either<Failure, CurrencyEntity>> call(CurrencyParams param) async {
    return await currencyRepository.getCurrencyExchange(param);
  }
}

/// Parameters of the currency conversion.

class CurrencyParams extends Equatable {
  final String base;
  final String target;
  final String amount;

  const CurrencyParams({required this.base, required this.target, required this.amount});

  @override
  List<Object?> get props => [base, target, amount];
}
