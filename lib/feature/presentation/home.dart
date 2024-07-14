import 'package:currency_exchange/feature/presentation/resuable/custom_textfield.dart';
import 'package:currency_exchange/feature/presentation/resuable/main_btn.dart';
import 'package:currency_exchange/feature/presentation/resuable/title.dart';
import 'package:currency_exchange/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/local_data/local_data_bloc.dart';
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
  String baseCode = "LKR";
  String targetCode = "USD";

  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 16, right: 16, bottom: 20.h),
          child: BlocBuilder<LocalDataBloc, LocalDataState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Center(
                      child: Text(
                        'Advance Exchanger',
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    ),
                    // Insert value textfield
                    const CustomTitle(
                      title: "Insert Value",
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
                                  keyboardType: TextInputType.phone,
                                  // borderColor: Colors.transparent,
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
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isDense: true,
                                isExpanded: false,
                                dropdownColor: const Color(0xFF262425),
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                value: baseCode,
                                items: countryCode
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    baseCode = value!;
                                    context.read<CurrencyBloc>().add(GetBaseCountry(baseCode: value));
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // conver to textfield
                    const CustomTitle(
                      title: "Convert to",
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
                              child: BlocBuilder<CurrencyBloc, CurrencyState>(
                                buildWhen: (prev, current) {
                                  if (prev.status == CurrencyStatus.initial && current.status == CurrencyStatus.loading) {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                },
                                builder: (context, state) {
                                  return CustomTextFormField(
                                    textController: TextEditingController(),
                                    hint: "${state.currencyEntity?.conversionResult.toStringAsFixed(2) ?? 0}",
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isDense: true,
                                isExpanded: false,
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                dropdownColor: const Color(0xFF262425),
                                style: const TextStyle(color: Colors.white),
                                value: targetCode,
                                items: countryCode
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    targetCode = value!;
                                    context.read<CurrencyBloc>().add(GetTargetCountry(targetCode: value));
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    // Add button
                    BlocConsumer<CurrencyBloc, CurrencyState>(
                      listener: (context, exchange) {
                        if (exchange.status == CurrencyStatus.loading) {
                          EasyLoading.show(status: 'Please wait');
                        } else if (exchange.status == CurrencyStatus.success) {
                          EasyLoading.dismiss();
                          context.read<CurrencyBloc>().baseValue.text = "";
                          context.read<LocalDataBloc>().add(AddToLocal(currencyEntity: exchange.currencyEntity!));
                        } else if (exchange.status == CurrencyStatus.failure) {
                          EasyLoading.dismiss();
                        }
                      },
                      builder: (context, exchange) {
                        return MainButton(
                          title: 'Add Currency',
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.read<CurrencyBloc>().add(const GetExchangeRate());
                          },
                        );
                      },
                    ),
                    // Local saved data
                    state.currencyEntity.isNotEmpty
                        ? const CustomTitle(
                            title: "Saved value",
                          )
                        : Container(),

                    state.currencyEntity.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.currencyEntity.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<LocalDataBloc>().add(RemoveToLocal(index: index));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF262425),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        state.currencyEntity[index].baseCode,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(state.currencyEntity[index].targetCode, style: const TextStyle(color: Colors.white)),
                                      trailing: Text(state.currencyEntity[index].conversionResult.toStringAsFixed(2),
                                          style: const TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container()
                  ],
                ),
              );
            },
          ),
        ));
  }
}
