import 'dart:async';
import 'package:currency_exchange/feature/domain/entity/currency_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'local_data_event.dart';
part 'local_data_state.dart';

class LocalDataBloc extends HydratedBloc<LocalDataEvent, LocalDataState> {
  LocalDataBloc() : super(const LocalDataState()) {
    on<AddToLocal>(_onAddToLocal);
    on<RemoveToLocal>(_onRemoveToLocal);
  }

  FutureOr<void> _onAddToLocal(AddToLocal event, Emitter<LocalDataState> emit) {
    final List<CurrencyEntity> newCurrencyParams = List.from(state.currencyEntity)..add(event.currencyEntity);

    emit(state.copyWith(
      status: LocalDataStatus.added,
      currencyEntity: newCurrencyParams,
    ));
  }

  FutureOr<void> _onRemoveToLocal(RemoveToLocal event, Emitter<LocalDataState> emit) {
    final List<CurrencyEntity> newCurrencyParams = List.from(state.currencyEntity)..removeAt(event.index);

    emit(state.copyWith(
      status: LocalDataStatus.removed,
      currencyEntity: newCurrencyParams,
    ));
  }

  @override
  LocalDataState? fromJson(Map<String, dynamic> json) {
    return LocalDataState(
      status: localDataStatusTypeValues.map[json['status']] ?? LocalDataStatus.initial,
      currencyEntity: List<CurrencyEntity>.from(json['currencyList'].map((x) => CurrencyEntity.fromJson(x))),
    );
  }

  @override
  Map<String, dynamic>? toJson(LocalDataState state) {
    return {
      'status': localDataStatusTypeValues.reverse[state.status],
      'currencyList': List<dynamic>.from(state.currencyEntity.map((e) => e.toJson())),
    };
  }
}
