part of 'local_data_bloc.dart';

abstract class LocalDataEvent extends Equatable {
  const LocalDataEvent();
}

// Event is used to add the currency entity to the local storage.
class AddToLocal extends LocalDataEvent {
  final CurrencyEntity currencyEntity;

  const AddToLocal({
    required this.currencyEntity,
  });

  @override
  List<Object> get props => [currencyEntity];
}

// Event is used to remove the currency entity from the local storage.
class RemoveToLocal extends LocalDataEvent {
  final int index;

  const RemoveToLocal({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
