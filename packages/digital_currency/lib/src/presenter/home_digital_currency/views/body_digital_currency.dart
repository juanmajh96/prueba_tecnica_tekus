import 'package:digital_currency/src/presenter/customs_widgets/custom_error_widget.dart';
import 'package:digital_currency/src/presenter/customs_widgets/custom_list_title.dart';
import 'package:digital_currency/src/presenter/customs_widgets/shimmer_animation.dart';
import 'package:digital_currency/src/presenter/details_digital_currency/views/_home_details_digital_currency.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

///
class BodyDigitalCurrency extends StatelessWidget {
  ///
  const BodyDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bodyBloc = InheritedDigitalCurrency.of(context)!.bodyBloc;
    return ValueListenableBuilder<StateBodyBloc>(
      valueListenable: _bodyBloc.state,
      builder: (context, state, child) {
        if (state is CompleteState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final _data = state.listData[index];
                return CustomListTitle(
                  amount: _data.amount,
                  currency: '${_data.base}-${_data.currency}',
                  date: _data.date,
                  onTap: () => showCustomDialog(context, _data),
                );
              },
              childCount: state.listData.length,
            ),
          );
        }
        if (state is ErrorState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: SizedBox(
                    height: 350,
                    child: CustomErrorWidget(
                      digitalCurrencyError: state.error,
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                child: ShimmerAnimation(
                  height: 52,
                ),
              );
            },
            childCount: 20,
          ),
        );
      },
    );
  }
}
