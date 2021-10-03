import 'package:digital_currency/src/domain/entities/data_entity.dart';

///[responseEntity] facade for data
class ResponseEntity {
  /// data may changed easilynb
  ResponseEntity({
    required this.dataEntityList,
  });

  /// list of DataEntity
  final List<DataEntity> dataEntityList;
}
