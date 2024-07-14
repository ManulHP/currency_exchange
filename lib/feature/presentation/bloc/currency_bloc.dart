import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../domain/entity/currency_entity.dart';
import '../../domain/usecase/currency_usecase.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyUsecase currencyUsecase;

  final TextEditingController baseValue = TextEditingController();
  final FocusNode baseNode = FocusNode();

  @override
  Future<void> close() {
    baseValue.dispose();
    baseNode.dispose();

    return super.close();
  }

  CurrencyBloc({required this.currencyUsecase}) : super(const CurrencyState()) {
    on<GetExchangeRate>(_onGetExchangeRate);
    on<GetTargetCountry>(_onGetTargetCountry);
    on<GetBaseCountry>(_onGetBaseCountry);
    on<GetAmount>(_onGetAmount);
  }

  FutureOr<void> _onGetAmount(GetAmount event, Emitter<CurrencyState> emit) {
    debugPrint("#88547 amount ${event.amount}");
    emit(state.copyWith(
      amount: event.amount,
      status: CurrencyStatus.initial,
    ));
  }

  FutureOr<void> _onGetTargetCountry(GetTargetCountry event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(
      targetCode: event.targetCode,
      status:   CurrencyStatus.initial,
    ));
  }

  FutureOr<void> _onGetBaseCountry(GetBaseCountry event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(
      baseCode: event.baseCode,
      status:   CurrencyStatus.initial,
    ));
  }

  FutureOr<void> _onGetExchangeRate(GetExchangeRate event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));

    final param = CurrencyParams(base: state.baseCode, target: state.targetCode, amount: state.amount);

    Either<Failure, CurrencyEntity> result = await currencyUsecase(param);

    result.fold((failure) {
      String message = '';
      if (failure is ServerFailure) {
        message = failure.message;
      } else if (failure is NoConnectionFailure) {
        message = "Please check your internet connection and try again.";
      } else {
        message = "Something went wrong. Please try again later!";
      }
      debugPrint("#88547 error $message");
      emit(state.copyWith(status: CurrencyStatus.failure, errorMessage: message));
    }, (data) {
      debugPrint("#88547 success $data");
      emit(state.copyWith(status: CurrencyStatus.success, currencyEntity: data));
    });
  }
}
