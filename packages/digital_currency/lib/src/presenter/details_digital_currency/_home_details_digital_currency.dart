import 'dart:ui';

import 'package:digital_currency/src/presenter/details_digital_currency/body_details_digital_currency.dart';
import 'package:flutter/material.dart';

///
void showCustomDialog(BuildContext context) => showGeneralDialog(
      barrierLabel: 'Barrier',
      barrierDismissible: true,
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 450),
      context: context,
      pageBuilder: (_, __, ___) {
        return const BodyDetailsDigitalCurrency();
      },
      transitionBuilder: (_, anim, __, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * anim.value,
            sigmaY: 4 * anim.value,
          ),
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        );
      },
    );
