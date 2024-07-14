import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../domain/entity/currency_entity.dart';
import '../../domain/repository/currency_repository.dart';
import '../../domain/usecase/currency_usecase.dart';
import '../datasource/currency_remote_datasource.dart';

/// This class is used to define the repository of the application
/// 
/// The repository will interact with the data sources and return the result to the usecase.
/// 
/// The repository will return a CurrencyEntity object if the process is successful.
/// 
/// Otherwise, it will return a Failure object.

class CurrencyRepositoryImpl implements CurrencyRepository {
  final InternetInfo internetInfo;
  final CurrencyRemoteDataSource remoteDataSource;

  const CurrencyRepositoryImpl({required this.internetInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, CurrencyEntity>> getCurrencyExchange(CurrencyParams params) async {
    if (await internetInfo.isConnectedToInternet) {
      try {
        final data = await remoteDataSource.getCurrencyExchange(params);
        return Right(data.toEntity());
      } on Exception {
        return const Left(ServerFailure(message: 'Failed to fetch data'));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
