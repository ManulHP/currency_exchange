import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/bloc/local_data/local_data_bloc.dart';
import 'core/network/dio_client.dart';
import 'core/network/network_info.dart';
import 'feature/data/datasource/currency_remote_datasource.dart';
import 'feature/data/repository/currency_repository_impl.dart';
import 'feature/domain/repository/currency_repository.dart';
import 'feature/domain/usecase/currency_usecase.dart';
import 'feature/presentation/bloc/currency_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocators() async {
  /// Network
  sl.registerFactory<Dio>(() => Dio());
  sl.registerFactory<DioClient>(() => DioClient(public: sl<Dio>()));
  sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  /// Feature: Exchange rate
  sl.registerFactory<CurrencyBloc>(() => CurrencyBloc(currencyUsecase: sl()));
  sl.registerLazySingleton<CurrencyUsecase>(() => CurrencyUsecase(currencyRepository: sl()));
  sl.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(internetInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<CurrencyRemoteDataSource>(() => CurrencyRemoteDataSourceImpl(dioClient: sl()));

  /// Local storage bloc
  sl.registerLazySingleton<LocalDataBloc>(() => LocalDataBloc());
}
