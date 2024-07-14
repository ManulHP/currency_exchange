import 'package:dio/dio.dart';

/// This class is used to define Dio
///
/// The class has a Dio object which is used to make network requests
///
/// The class has a public Dio object which is used to make public network requests
///
/// The class can have multiple Dio objects for different purposes

class DioClient {
  Dio auth;

  DioClient({
    required this.auth,
  }) {
    auth.options = BaseOptions(
      baseUrl:"",
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
    );
  }
}
