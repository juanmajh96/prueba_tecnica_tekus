import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:flutter/material.dart' show ValueNotifier;

/// state manager
class DetailsBloc {
  /// received usecase
  DetailsBloc({required this.getData});

  /// usecase
  final GetData getData;

  final _state = ValueNotifier<StateDetailsBloc>(InitialStateDetails());

  ///get state
  ValueNotifier<StateDetailsBloc> get state => _state;

  /// emits states of bloc depending on the response of usecase [GetData]
  Future<void> getDataBloc(String date) async {
    _state.value = LoadingStateDetails();
    final _result = await getData(
      RequestEntity(
        requestDetails: true,
        date: date,
      ),
    );
    _result.fold(
      (error) => _state.value = ErrorStateDetails(error: error),
      (response) => _state.value = CompleteStateDetails(
        listData: response.dataEntityList,
      ),
    );
  }
}

/// States of bloc
abstract class StateDetailsBloc {}

/// Initial state
class InitialStateDetails extends StateDetailsBloc {}

/// Waiting for data
class LoadingStateDetails extends StateDetailsBloc {}

/// Unexpected failure
class ErrorStateDetails extends StateDetailsBloc {
  ///capture exeption
  ErrorStateDetails({required this.error});

  /// exeption object
  final DigitalCurrencyError error;
}

/// Succesful
class CompleteStateDetails extends StateDetailsBloc {
  /// when is Succesful there are data
  CompleteStateDetails({required this.listData});

  /// list lastest two weeks
  final List<DataEntity> listData;
}
