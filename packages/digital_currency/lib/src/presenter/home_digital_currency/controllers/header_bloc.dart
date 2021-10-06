import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:flutter/material.dart' show ValueNotifier;

/// state manager
class HeaderBloc {
  /// lisening stream when object is created, then emit state
  HeaderBloc({required this.getDataRealTime}) : super() {
    _streamSubscription =
        getDataRealTime(const RequestEntity()).listen((event) {
      event.fold(
        (error) => _state.value = ErrorStateHeader(error: error),
        (response) => _state.value = CompleteStateHeader(
          listData: response.dataEntityList,
        ),
      );
    });
  }

  late StreamSubscription<Either<DigitalCurrencyError, ResponseEntity>>
      _streamSubscription;

  /// usecase
  final GetDataRealTime getDataRealTime;

  final _state = ValueNotifier<StateHeaderBloc>(InitialStateHeader());

  ///get state
  ValueNotifier<StateHeaderBloc> get state => _state;

  /// destroyed resources
  void dispose() {
    _streamSubscription.cancel();
  }
}

/// States of bloc
abstract class StateHeaderBloc {}

/// Initial state
class InitialStateHeader extends StateHeaderBloc {}

/// Waiting for data
class LoadingStateHeader extends StateHeaderBloc {}

/// Unexpected failure
class ErrorStateHeader extends StateHeaderBloc {
  ///capture exeption
  ErrorStateHeader({required this.error});

  /// exeption object
  final DigitalCurrencyError error;
}

/// Succesful
class CompleteStateHeader extends StateHeaderBloc {
  /// when is Succesful there are data
  CompleteStateHeader({required this.listData});

  /// List lastest two weeks
  final List<DataEntity> listData;
}
