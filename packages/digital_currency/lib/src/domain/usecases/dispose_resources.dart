import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[DisposeResource] usecase return data
abstract class DisposeResource {
  ///
  void call();
}

///
class DisposeResourceImpl implements DisposeResource {
  ///
  const DisposeResourceImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  void call() => _repositories.disposeResource();
}
