import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_data_event.dart';
part 'local_data_state.dart';

class LocalDataBloc extends Bloc<LocalDataEvent, LocalDataState> {
  LocalDataBloc() : super(LocalDataInitial());

  @override
  Stream<LocalDataState> mapEventToState(
    LocalDataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
