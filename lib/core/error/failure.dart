import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

// Server errors
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

// Connection Issues
class NoConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}
