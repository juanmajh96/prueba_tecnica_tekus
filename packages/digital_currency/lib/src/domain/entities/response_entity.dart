import 'package:digital_currency/src/domain/entities/data_entity.dart';

/// Facade for data
class ResponseEntity {
  /// Data may changed easilynb
  ResponseEntity({
    required this.dataEntityList,
  });

  /// List of DataEntity
  final List<DataEntity> dataEntityList;
}
