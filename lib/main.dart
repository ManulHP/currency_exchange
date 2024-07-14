import 'dart:async';
import 'package:currency_exchange/core/bloc/bloc_observer.dart';
import 'package:currency_exchange/core/presentation/easy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'currency_exchange.dart';
import 'injector.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Injector setup
      await setupLocators();

      /// Set theme for EasyLoader indicator
      ConfigEasyLoader.darkTheme();

      /// Setup global observer to monitor all blocs
      Bloc.observer = CurrencyBlocObserver();

      /// Hydrated bloc initialized
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
        // await getTemporaryDirectory(),
      );

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      runApp(const CurrencyExchangeWrapper());
    },
    (error, stack) {
      debugPrint("runZonedGuarded: Caught error in my root zone. $error");
    },
  );
}
