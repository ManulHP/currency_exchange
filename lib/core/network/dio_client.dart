import 'package:currency_exchange/util/api_endpoint.dart';
import 'package:dio/dio.dart';

/// This class is used to define Dio
///
/// The class has a Dio object which is used to make network requests
///
/// The class has a public Dio object which is used to make public network requests
///
/// The class can have multiple Dio objects for different purposes

class DioClient {
  Dio public;

  DioClient({
    required this.public,
  }) {
    public.options = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000)
    );
  }
}
