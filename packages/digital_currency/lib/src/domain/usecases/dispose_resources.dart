import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[DisposeResource] usecase dispose resource
abstract class DisposeResource {
  /// Usecase method
  void call();
}

/// Implementation of DisposeResource
class DisposeResourceImpl implements DisposeResource {
  /// Recibed DigitalCurrencyRepositories
  const DisposeResourceImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  void call() => _repositories.disposeResource();
}
