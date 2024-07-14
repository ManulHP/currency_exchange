import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/currency_entity.dart';
import '../usecase/currency_usecase.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyEntity>> getCurrencyExchange(CurrencyParams params);
}