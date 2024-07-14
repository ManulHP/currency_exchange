import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entity/currency_entity.dart';
import '../usecase/currency_usecase.dart';

/// This abstract class is used to define the methods that are used to interact with the data sources
/// 
/// The method will return a CurrencyEntity object if the process is successful.
/// 
/// Otherwise, it will return a Failure object.

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyEntity>> getCurrencyExchange(CurrencyParams params);
}
