import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entity/currency_entity.dart';
import '../usecase/currency_usecase.dart';

/// CurrencyRepository class is an abstract class that holds the method to get the currency exchange.
/// The method will return a CurrencyEntity object if the process is successful.
/// Otherwise, it will return a Failure object.

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyEntity>> getCurrencyExchange(CurrencyParams params);
}
