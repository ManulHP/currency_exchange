import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/presentation/home.dart';

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({super.key});

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            showPerformanceOverlay: false,
            builder: (context, child) {
              child = EasyLoading.init()(context, child);
              return ScrollConfiguration(
                behavior: AppBehavior(),
                child: child,
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Currency code',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const HomeScreenWrapper()
    );
  }
}

/// To remove scroll glow
class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
