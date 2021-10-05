import 'package:digital_currency/src/presenter/customs_widgets/card_widget.dart';
import 'package:digital_currency/src/presenter/customs_widgets/custom_error_widget.dart';
import 'package:digital_currency/src/presenter/customs_widgets/shimmer_animation.dart';
import 'package:digital_currency/src/presenter/details_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/details_digital_currency/views/_home_details_digital_currency.dart';
import 'package:flutter/material.dart';

///
class BodyDetailsDigitalCurrency extends StatelessWidget {
  ///
  const BodyDetailsDigitalCurrency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _detailsBloc =
        InheritedDetailsDigitalCurrency.of(context)!.detailsBloc;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ValueListenableBuilder(
            valueListenable: _detailsBloc.state,
            builder: (context, state, child) {
              if (state is CompleteStateDetails) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            CardWidget(
                              amount: state.listData[0].amount,
                              icon: const Text(
                                '🇪🇺',
                                style: TextStyle(fontSize: 25),
                              ),
                              currency: state.listData[0].currency,
                              base: state.listData[0].base,
                            ),
                            const SizedBox(width: 10),
                            CardWidget(
                              amount: state.listData[1].amount,
                              icon: const Text(
                                '🇺🇸',
                                style: TextStyle(fontSize: 25),
                              ),
                              currency: state.listData[1].currency,
                              base: state.listData[1].base,
                            ),
                            const SizedBox(width: 10),
                            CardWidget(
                              amount: state.listData[2].amount,
                              icon: const Text(
                                '🇨🇴 ',
                                style: TextStyle(fontSize: 25),
                              ),
                              currency: state.listData[2].currency,
                              base: state.listData[2].base,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          state.listData[0].date,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              if (state is ErrorStateDetails) {
                return Center(
                  child: CustomErrorWidget(digitalCurrencyError: state.error),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          CardShimmerLoading(),
                          SizedBox(width: 10),
                          CardShimmerLoading(),
                          SizedBox(width: 10),
                          CardShimmerLoading(),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  const ShimmerAnimation(
                    color: Colors.white,
                    borderRadius: 5,
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
