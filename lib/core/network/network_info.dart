import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> get isConnectedToInternet;
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnectionChecker connectionChecker;

  const InternetInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnectedToInternet => connectionChecker.hasConnection;

}
