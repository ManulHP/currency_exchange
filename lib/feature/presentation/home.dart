import 'package:currency_exchange/feature/presentation/resuable/custom_textfield.dart';
import 'package:currency_exchange/feature/presentation/resuable/main_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../injector.dart';
import 'bloc/currency_bloc.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CurrencyBloc>(create: (context) => sl<CurrencyBloc>())],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 16, right: 16, bottom: 20.h),
          child: BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Advance Exchanger',
                      style: TextStyle(fontSize: 28.sp),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Insert Value',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262425),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocSelector<CurrencyBloc, CurrencyState, String>(
                            selector: (state) {
                              return state.amount;
                            },
                            builder: (context, val) {
                              return CustomTextFormField(
                                textController: context.read<CurrencyBloc>().baseValue,
                                focusNode: context.read<CurrencyBloc>().baseNode,
                                hint: "Enter value",
                                isBorder: false,
                                onChanged: (text) => context.read<CurrencyBloc>().add(GetAmount(amount: text)),
                                onSubmitted: (text) => context.read<CurrencyBloc>().add(GetAmount(amount: text)),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // conver to
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Convert to',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262425),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            child: CustomTextFormField(
                              textController: TextEditingController(),
                              hint: "${state.currencyEntity?.conversionResult ?? 0}",
                              // borderColor: Colors.transparent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  // add button
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocConsumer<CurrencyBloc, CurrencyState>(
                            listener: (context, exchange) {
                              if (exchange.status == CurrencyStatus.loading) {
                                EasyLoading.show(status: 'Please wait');
                              } else if (exchange.status == CurrencyStatus.success) {
                                EasyLoading.dismiss();
                              } else if (exchange.status == CurrencyStatus.failure) {
                                EasyLoading.dismiss();
                              }
                            },
                            builder: (context, exchange) {
                              return MainButton(
                                title: 'Add Currency',
                                onPressed: () {
                                  context.read<CurrencyBloc>().add(GetExchangeRate());
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          MainButton(
                            title: 'Save Currency',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
