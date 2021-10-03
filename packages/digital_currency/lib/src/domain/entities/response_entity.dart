import 'package:digital_currency/src/domain/entities/data_entity.dart';

/// facade for data
class ResponseEntity {
  /// data may changed easilynb
  const ResponseEntity({
    required this.dataEntityList,
  });

  /// list of DataEntity
  final List<DataEntity> dataEntityList;
}
