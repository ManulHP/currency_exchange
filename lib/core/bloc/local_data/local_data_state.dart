part of 'local_data_bloc.dart';

enum LocalDataStatus { initial, added, removed, failure }

class LocalDataState extends Equatable {
  final String? errorMessage;
  final LocalDataStatus status;
  final List<CurrencyEntity> currencyEntity;

  const LocalDataState({
    this.errorMessage,
    this.status = LocalDataStatus.initial,
    this.currencyEntity = const [],
  });

  @override
  List<Object?> get props => [errorMessage, status, currencyEntity];

  LocalDataState copyWith({
    String? errorMessage,
    LocalDataStatus? status,
    List<CurrencyEntity>? currencyEntity,
  }) {
    return LocalDataState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      currencyEntity: currencyEntity ?? this.currencyEntity,
    );
  }
}

final localDataStatusTypeValues = EnumValues({
  "initial": LocalDataStatus.initial,
  "added": LocalDataStatus.added,
  "failure": LocalDataStatus.failure,
  "removed": LocalDataStatus.removed,
});

class EnumValues<T> {
  late Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
