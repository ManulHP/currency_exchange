part of 'local_data_bloc.dart';

abstract class LocalDataState extends Equatable {
  const LocalDataState();
}

class LocalDataInitial extends LocalDataState {
  @override
  List<Object> get props => [];
}
