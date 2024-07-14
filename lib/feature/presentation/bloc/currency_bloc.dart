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

  CurrencyBloc({required this.currencyUsecase}) : super(const CurrencyState()) {
    on<GetExchangeRate>(_onGetExchangeRate);
  }

  FutureOr<void> _onGetExchangeRate(GetExchangeRate event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));

    final param = CurrencyParams(base: event.baseCode, target: event.targetCode, amount: event.amount);

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
