import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:flutter/material.dart' show ValueNotifier;

/// State manager
class BodyBloc {
  /// Received usecase
  BodyBloc({required this.getData});

  /// Usecase
  final GetData getData;

  final _state = ValueNotifier<StateBodyBloc>(InitialState());

  ///Get state
  ValueNotifier<StateBodyBloc> get state => _state;

  /// Emits states of bloc depending on the response of usecase [GetData]
  Future<void> getDataBloc() async {
    _state.value = LoadingState();
    final _result = await getData(const RequestEntity());
    _result.fold(
      (error) => _state.value = ErrorState(error: error),
      (response) => _state.value = CompleteState(
        listData: response.dataEntityList,
      ),
    );
  }
}

/// States of bloc
abstract class StateBodyBloc {}

/// Initial state
class InitialState extends StateBodyBloc {}

/// Waiting for data
class LoadingState extends StateBodyBloc {}

/// Unexpected failure
class ErrorState extends StateBodyBloc {
  ///capture exeption
  ErrorState({required this.error});

  /// Exeption object
  final DigitalCurrencyError error;
}

/// Succesful
class CompleteState extends StateBodyBloc {
  /// When is Succesful there are data
  CompleteState({required this.listData});

  /// List lastest two weeks
  final List<DataEntity> listData;
}
