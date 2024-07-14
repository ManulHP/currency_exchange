import 'package:currency_exchange/util/api_endpoint.dart';
import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../domain/usecase/currency_usecase.dart';
import '../model/currency_model.dart';

/// This abstract class is used to define the methods that are used to interact with the remote data source
/// 
/// The method will return a CurrencyModel object if the process is successful.
/// 
/// Otherwise, it will throw an exception.

abstract class CurrencyRemoteDataSource {
  Future<CurrencyModel> getCurrencyExchange(CurrencyParams topicParams);
}

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final DioClient dioClient;

  const CurrencyRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<CurrencyModel> getCurrencyExchange(CurrencyParams params) async {
    try {
      Response response = await dioClient.public.get(
        "${ApiEndpoint.exchangeRate}/${params.base}/${params.target}/${params.amount}",
      );

      final jsonData = response.data as Map<String, dynamic>;

      return CurrencyModel.fromJson(jsonData);
    } on DioException catch (err) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
