import 'dart:async';

import 'package:currency_exchange/core/bloc/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_exchange.dart';
import 'injector.dart';

void main() async {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      /// Injector setup
      await setupLocators();

      /// Setup global observer to monitor all blocs
      Bloc.observer = CurrencyBlocObserver();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      runApp(const CurrencyExchange());
    },
        (error, stack) {
      debugPrint("runZonedGuarded: Caught error in my root zone. $error");
    },
  );
}